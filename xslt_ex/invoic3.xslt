<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ns0="http://sap.com/xi/B2B/Examples/Odette">

    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    
    <xsl:template match="/INVOIC02">
        <ns0:INVOIC3 xmlns:ns0="http://sap.com/xi/B2B/Examples/Odette">
            
            <S_UNB>
                <C_S001>
                    <D_0001>UNOC</D_0001>
                    <D_0002>1</D_0002>
                </C_S001>
                <C_S002>
                    <D_0004><xsl:value-of select="IDOC/EDI_DC40/SNDPRN"/></D_0004>
                    <D_0007>OD</D_0007>
                </C_S002>
                <C_S003>
                    <D_0010><xsl:value-of select="IDOC/EDI_DC40/RCVPOR"/></D_0010>
                    <D_0007>OD</D_0007>
                </C_S003>
                <C_S004>
                    <D_0017><xsl:value-of select="IDOC/EDI_DC40/CREDAT"/></D_0017>
                    <D_0019><xsl:value-of select="IDOC/EDI_DC40/CRETIM"/></D_0019>
                </C_S004>
                <D_0020><xsl:value-of select="IDOC/EDI_DC40/DOCNUM"/></D_0020>
                <D_0026>INVOIC</D_0026>
            </S_UNB>

            
            <M_INVOIC>
                <S_UNH>
                    <D_0062>1</D_0062>
                    <C_S009>
                        <D_0065>INVOIC</D_0065>
                        <D_0052>3</D_0052>
                        <D_0051>OD</D_0051>
                    </C_S009>
                </S_UNH>

                
                <S_MID>
                    <D_1004><xsl:value-of select="IDOC/E1EDK01/BELNR"/></D_1004>
                    <C_C040>
                        <D_2007>
                            <xsl:variable name="original"><xsl:value-of select="IDOC/EDI_DC40/CREDAT"/></xsl:variable>
                            <xsl:value-of select="substring($original, 3)"></xsl:value-of>
                        </D_2007>
                    </C_C040>
                </S_MID>

                
                <S_SDT>
                    <C_C046>
                        <D_3347><xsl:value-of select="IDOC/E1EDKA1[PARVW='RS']/PARTN"/></D_3347>
                        <D_3036><xsl:value-of select="IDOC/E1EDKA1[PARVW='RS']/NAME1"/></D_3036>
                        <D_3124/><D_3124_2><xsl:value-of select="IDOC/E1EDKA1[PARVW='RS']/STRAS"/></D_3124_2>
                        <D_3124_3><xsl:value-of select="IDOC/E1EDKA1[PARVW='RS']/PSTLZ"/>
                        <xsl:value-of select="IDOC/E1EDKA1[PARVW='RS']/ORT01"/></D_3124_3>
                        <D_3296><xsl:value-of select="IDOC/E1EDKA1[PARVW='RS']/PARTN"/></D_3296>
                    </C_C046>
                    <D_3808/>
                    <D_3207><xsl:value-of select="IDOC/E1EDKA1[PARVW='RS']/LAND1"/></D_3207>
                </S_SDT>

                
                <S_BDT>
                    <C_C056>
                        <D_3003><xsl:value-of select="IDOC/E1EDKA1[PARVW='RE']/PARTN"/></D_3003>
                        <D_3036><xsl:value-of select="IDOC/E1EDKA1[PARVW='RE']/NAME1"/></D_3036>
                        <D_3124/><D_3124_2><xsl:value-of select="IDOC/E1EDKA1[PARVW='RE']/STRAS"/></D_3124_2>
                        <D_3124_3><xsl:value-of select="IDOC/E1EDKA1[PARVW='RE']/PSTLZ"/>
                        <xsl:value-of select="IDOC/E1EDKA1[PARVW='RE']/ORT01"/></D_3124_3>
                        <D_3296><xsl:value-of select="IDOC/E1EDKA1[PARVW='RE']/PARTN"/></D_3296>
                    </C_C056>
                    <D_3808/>
                    <D_3207><xsl:value-of select="IDOC/E1EDKA1[PARVW='RE']/LAND1"/></D_3207>
                </S_BDT>

                
                <G_SG1>
                    <S_RAD>
                        <D_1004><xsl:value-of select="IDOC/E1EDK02[QUALF='012']/BELNR"/></D_1004>
                        <C_C087>
                            <D_2007><xsl:value-of select="substring(IDOC/E1EDK02[QUALF='012']/DATUM, 3)"/></D_2007>
                        </C_C087>
                    </S_RAD>
                    <S_CSG>
                        <C_C013>
                            <D_3133><xsl:value-of select="IDOC/E1EDKA1[PARVW='WE']/PARTN"/></D_3133>
                            <D_3036><xsl:value-of select="IDOC/E1EDKA1[PARVW='WE']/NAME1"/></D_3036>
                        </C_C013>
                    </S_CSG>
                    <G_SG2>
                        <S_ARD>
                            <C_C001>
                                <D_7304><xsl:value-of select="IDOC/E1EDP01/E1EDP19[QUALF='001']/IDTNR"/></D_7304>
                                <D_7194><xsl:value-of select="IDOC/E1EDP01/E1EDP19[QUALF='002']/IDTNR"/></D_7194>
                            </C_C001>
                            <C_C002>
                                <D_6270><xsl:value-of select="IDOC/E1EDP01/MENGE"/></D_6270>
                                <D_6410><xsl:value-of select="IDOC/E1EDP01/E1EDP02[QUALF='001']/BELNR"/></D_6410>
                            </C_C002>
                            <C_C003>
                                <D_1022><xsl:value-of select="IDOC/E1EDP05/KSCHL"/></D_1022>
                            </C_C003>
                        </S_ARD>
                        <S_PRI>
                            <C_C084>
                                <D_5110><xsl:value-of select="IDOC/E1EDP01/E1EDP05/KRATE"/></D_5110>
                                <D_5284><xsl:value-of select="IDOC/E1EDP01/E1EDP05/UPRBS"/></D_5284>
                            </C_C084>
                            <D_5116><xsl:value-of select="IDOC/E1EDP01/E1EDP05/BETRG"/></D_5116>
                        </S_PRI>
                    </G_SG2>
                </G_SG1>

                
                <S_VAT>
                    <D_5338><xsl:value-of select="IDOC/E1EDP01/E1EDP05/BETRG"/></D_5338>
                    <D_5122><xsl:value-of select="IDOC/E1EDP04/MSATZ"/></D_5122>
                    <D_5490><xsl:value-of select="IDOC/E1EDP04/MWSBT"/></D_5490>
                </S_VAT>

                
                <S_TLR>
                    <D_5214><xsl:value-of select="IDOC/E1EDS01[SUMID='010']/SUMME"/></D_5214>
                    <D_5068><xsl:value-of select="IDOC/E1EDS01[SUMID='011']/SUMME"/></D_5068>
                    <D_5338><xsl:value-of select="IDOC/E1EDS01[SUMID='010']/SUMME"/></D_5338>
                    <D_5490><xsl:value-of select="IDOC/E1EDS01[SUMID='005']/SUMME"/></D_5490>
                </S_TLR>

                <S_UNT>
                    <D_0074>$B2B_SEG_COUNTER</D_0074>
                    <D_0062>1</D_0062>
                </S_UNT>

            </M_INVOIC>
                
            <S_UNZ>
                <D_0036>1</D_0036>
                <D_0036><xsl:value-of select="substring(IDOC/EDI_DC40/DOCNUM, 10)"/></D_0036>
            </S_UNZ>

            
        </ns0:INVOIC3>
    </xsl:template>

</xsl:stylesheet>