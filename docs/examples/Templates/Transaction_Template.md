---
layout: default
title: Transaction Extension Templates
parent: Examples
nav_order: 1
---

# Transaction Extension Templates
{: .no_toc }

Working with the Trransaction Extensions in XtendM3
{: .fs-6 .fw-300 }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description

Documentation cointains a template for a Transaction extension with a structure that can be used for creating a new extension using container contruction and setting parameters. 
Template can be as modified as needed

```groovy
public class TransactionTemplate extends ExtendM3Transaction {
  private final MIAPI mi;
  private final DatabaseAPI database;
  private final MICallerAPI miCaller;
  private final LoggerAPI logger;
  private final ProgramAPI program;

  public TransactionTemplate(MIAPI mi, DatabaseAPI database, MICallerAPI miCaller, LoggerAPI logger, ProgramAPI program) {
    this.mi = mi;
    this.database = database;
    this.miCaller = miCaller;
    this.logger = logger;
    this.program = program;
  }

  public void main() {

    def callback = {
      Map <String, String> out ->

        if (out.error != null) {
          mi.error(out.errorMessage);
          return;
        }

        mi.outData.put("CONO", out.get("CONO").trim());
        mi.outData.put("WHLO", out.get("WHLO").trim());
        mi.outData.put("DLIX", out.get("DLIX").trim());
        mi.outData.put("PLSX", out.get("PLSX").trim());
        mi.outData.put("PISS", out.get("PISS").trim());

        String zrdn = "";
        String zcnd = "";
        if (out.get("RORC").toInteger() == 3) {
          DBAction query = database.table("MHDISH")
            .index("00")
            .selection("OQCONO","OQINOU","OQDLIX","OQRIDN").build();
          DBContainer MHDISH = query.getContainer();
          MHDISH.set("OQCONO", out.get("CONO").trim().toInteger());
          MHDISH.set("OQINOU", 1);
          MHDISH.set("OQDLIX", out.get("DLIX").trim().toInteger());
          if(query.read(MHDISH)){
            zrdn = MHDISH.get("OQRIDN");
            zcnd = getDeliveryAddressName(zrdn, out);
          }
        }
        mi.outData.put("ZRDN", zrdn);
        mi.outData.put("ZCND", zcnd);
        mi.write();
    }

    def params = [ "WHLO": mi.inData.get("WHLO"),
                   "FPIS": mi.inData.get("ZFPI"),
                   "TPIS": mi.inData.get("ZTPI"),
                   "FORC": mi.inData.get("ZFOR"),
                   "TORC": mi.inData.get("ZTOR"),
                   "FSEQ": mi.inData.get("ZFSE"),

    ];
    //.error("${params}");
    miCaller.call("MWS420MI", "TransactionTemplate", params, callback);
  }

  /**
   * Retrieve delivery address name
   * @param
   * @return deliveryName
   */
  String getDeliveryAddressName(String orderNo, Map<String, String> params) {
    String deliveryAddress = "";
    DBAction query = database.table("OOHEAD")
      .index("00")
      .selection("OAORNO","OACUNO","OAADID").build();
    DBContainer OOHEAD = query.getContainer();
    OOHEAD.set("OACONO", program.LDAZD.get("CONO"));
    OOHEAD.set("OAORNO", orderNo);
    if(query.read(OOHEAD)){
      int iter = 0;
      Closure<?> OOADRECallback = {
        DBContainer data->
          if (iter > 1) {
            return;
          }
          iter = iter + 1;
          deliveryAddress = data.get("ODCUNM");
          logger.debug("XtendM3Debug_TransactionTemplate: ${orderNo} OOADRE ${deliveryAddress}");
      }

      query = database.table("OOADRE")
        .index("00")
        .selection("ODCUNM").build();
      DBContainer OOADRE = query.getContainer();
      OOADRE.set("ODCONO", OOHEAD.get("OACONO"));
      OOADRE.set("ODORNO", OOHEAD.get("OAORNO"));
      OOADRE.set("ODADRT", 1);

      if(query.readAll(OOADRE, 3, OOADRECallback)){
        return deliveryAddress;
      }

      query = database.table("OCUSAD")
        .index("00")
        .selection("OPCUNM").build();
      DBContainer OCUSAD = query.getContainer();
      OCUSAD.set("OPCONO", OOHEAD.get("OACONO"));
      OCUSAD.set("OPCUNO", OOHEAD.get("OACUNO"));
      OCUSAD.set("OPADRT", 1);
      OCUSAD.set("OPADID", OOHEAD.get("OAADID"));
      if(query.read(OCUSAD)){
        deliveryAddress = OCUSAD.get("OPCUNM");
        logger.debug("XtendM3Debug_TransactionTemplate: ${orderNo} OCUSAD ${deliveryAddress}");
        return deliveryAddress;
      }

      logger.debug("XtendM3Debug_TransactionTemplate: ${orderNo} CONO=${OOHEAD.get('OACONO')} LDAZD=${params['CONO'].toInteger()} CUNO=${OOHEAD.get('OACUNO')} ${params['CUNO']}");
      if (OOHEAD.get("OACONO") != params["CONO"].toInteger() || OOHEAD.get("OACUNO") != params["CUNO"]) {
        query = database.table("OCUSMA")
          .index("00")
          .selection("OKCUNM").build();
        DBContainer OCUSMA = query.getContainer();
        OCUSMA.set("OKCONO", OOHEAD.get("OACONO"));
        OCUSMA.set("OKCUNO", OOHEAD.get("OKCUNO"));
        if(query.read(OCUSMA)){
          deliveryAddress = OCUSMA.get("OKCUNM");
          return deliveryAddress;
        }
      }
    }
    return deliveryAddress;
  }
}

```