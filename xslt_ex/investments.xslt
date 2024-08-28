<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes"
        encoding="UTF-8" indent="yes" />
    
    
    <xsl:template match="/">

        <portfolio>

            <xsl:for-each select="/investments/item">
            
                <stock exchange='{@exch}'>
                    <name><xsl:value-of select="@company"></xsl:value-of></name>
                    <symbol><xsl:value-of select="@symbol"></xsl:value-of></symbol>
                    <price><xsl:value-of select="@price"></xsl:value-of></price>
                </stock>

            </xsl:for-each>

        </portfolio>

    </xsl:template>
</xsl:transform>