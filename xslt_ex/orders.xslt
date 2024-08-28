<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ns0="http://sap.com/xi/B2B/Examples/EDIFACT">


    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>


    <xsl:template match="/ns0:ORDERS96A">
        <ORDERS05>
            <IDOC BEGIN="1">
                <!--  EDI_DC40  -->
                <EDI_DC40 SEGMENT="1">
                    <TABNAM>EDI_DC40</TABNAM>
                    <DIRECT>2</DIRECT>
                    <IDOCTYP>ORDERS05</IDOCTYP>
                    <MESTYP>ORDERS</MESTYP>
                    <STDMES>ORDERS</STDMES>
                    <SNDPOR>SNDPOR</SNDPOR>
                    <SNDPRT>SNDPRT</SNDPRT>
                    <SNDPRN>SNDPRN</SNDPRN>
                    <RCVPOR>RCVPOR</RCVPOR>
                    <RCVPRT>LS</RCVPRT>
                    <RCVPRN>RCVPRN</RCVPRN>
                    <CREDAT>20231220</CREDAT>
                    <CRETIM>094009</CRETIM>
                    <REFINT><xsl:value-of select="S_UNB/D_0020"/></REFINT>
                    <REFMES>ORDERS05</REFMES>
                </EDI_DC40>

                <!--  E1EDK01  -->
                <E1EDK01 SEGMENT="1">
                    <ACTION>000</ACTION>
                    <CURCY><xsl:value-of select="M_ORDERS/G_SG7/S_CUX/C_C504_1/D_6345"/></CURCY>
                    <BELNR><xsl:value-of select="M_ORDERS/S_BGM/D_1004"/></BELNR>
                </E1EDK01>

                <!--  E1EDK14 -->
                <xsl:apply-templates select="S_UNB/C_S001"/>
                <xsl:apply-templates select="S_UNB/C_S002"/>
                <xsl:apply-templates select="S_UNB/C_S003"/>
                <xsl:apply-templates select="S_UNB/C_S004"/>

                <!--  E1EDK03  -->
                <E1EDK03 SEGMENT="1">
                    <IDDAT>01<xsl:value-of select="S_UNB/D_0031"/></IDDAT>
                    <DATUM>20<xsl:value-of select="S_UNB/C_S004/D_0017"/></DATUM>
                </E1EDK03>

                <!--  NAD  -->
                <xsl:apply-templates select="M_ORDERS/G_SG2/S_NAD[D_3035='DP']"/>
                <xsl:apply-templates select="M_ORDERS/G_SG2/S_NAD[D_3035='IV']"/>

                <!--  E1EDP01  -->
                
                <xsl:apply-templates select="M_ORDERS/G_SG25"/>
                

            </IDOC>
        </ORDERS05>
    </xsl:template>

    <!--  E1EDK14  -->
    <xsl:template match="S_UNB/C_S001">
        <E1EDK14 SEGMENT="1">
            <QUALF>012</QUALF>
            <ORGID>Auftragsart</ORGID>
        </E1EDK14>
    </xsl:template>
    
    <xsl:template match="S_UNB/C_S002">
        <E1EDK14 SEGMENT="1">
            <QUALF>006</QUALF>
            <ORGID>Sparte</ORGID>
        </E1EDK14>
    </xsl:template>

    <xsl:template match="S_UNB/C_S003">
        <E1EDK14 SEGMENT="1">
            <QUALF>007</QUALF>
            <ORGID>Vertriebsweg</ORGID>
        </E1EDK14>
    </xsl:template>

    <xsl:template match="S_UNB/C_S004">
        <E1EDK14 SEGMENT="1">
            <QUALF>008</QUALF>
            <ORGID>Verkauftsorganisation</ORGID>
        </E1EDK14>
    </xsl:template>

    <!--  NAD  -->
    <xsl:template match="G_SG2/S_NAD[D_3035='DP']">
        <E1EDKA1 SEGMENT="1">
            <PARVW>WE</PARVW>
            <PARTN><xsl:value-of select="C_C082/D_3039"/></PARTN>
            <NAME1><xsl:value-of select="C_C080/D_3036_1"/></NAME1>
            <STRAS><xsl:value-of select="C_C059/D_3042_1"/></STRAS>
            <ORT01><xsl:value-of select="D_3164"/></ORT01>
            <PSTLZ><xsl:value-of select="D_3251"/></PSTLZ>
            <LAND1><xsl:value-of select="D_3207"/></LAND1>
        </E1EDKA1>
    </xsl:template>

    <xsl:template match="G_SG2/S_NAD[D_3035='IV']">
        <E1EDKA1 SEGMENT="1">
            <PARVW>RE</PARVW>
            <PARTN><xsl:value-of select="C_C082/D_3039"/></PARTN>
            <NAME1><xsl:value-of select="C_C080/D_3036_1"/></NAME1>
            <NAME2><xsl:value-of select="C_C080/D_3036_2"/></NAME2>
            <STRAS><xsl:value-of select="C_C059/D_3042_1"/></STRAS>
            <STRS2><xsl:value-of select="C_C059/D_3042_2"/></STRS2>
            <ORT01><xsl:value-of select="D_3164"/></ORT01>
            <PSTLZ><xsl:value-of select="D_3251"/></PSTLZ>
            <LAND1><xsl:value-of select="D_3207"/></LAND1>
        </E1EDKA1>
    </xsl:template>

    <!--  E1EDP01  -->
    <xsl:template match="G_SG25">
        <E1EDP01 SEGMENT="1">
            <POSEX><xsl:value-of select="S_LIN/D_1082"/></POSEX>
            <MENGE><xsl:value-of select="S_QTY/C_C186/D_6060"/></MENGE>
            <MENEE>PCE</MENEE>
                
                <xsl:apply-templates select="//S_LIN"/>
                
        </E1EDP01>
    </xsl:template>

    <!-- E1EDP19 -->
    <xsl:template match="S_LIN">
        <E1EDP19 SEGMENT="1">
            <QUALF>003</QUALF>
            <IDTNR><xsl:value-of select="C_C212/D_7140"/></IDTNR>
        </E1EDP19>
    </xsl:template>
   
    
</xsl:stylesheet>
