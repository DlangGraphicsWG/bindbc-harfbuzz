module bindbc.hb;

public import bindbc.hb.config,
              bindbc.hb.bind;

version(BindHB_Static) {}
else public import bindbc.hb.dynload;
