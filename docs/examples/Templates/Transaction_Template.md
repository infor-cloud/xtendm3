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

}
```