<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes"
        encoding="UTF-8" indent="yes" />
    <xsl:template match="/">

        <receipt>
            
            <xsl:for-each select="/data/item">
                <row>

                    <product_name>
                        <xsl:value-of select="name"></xsl:value-of>
                    </product_name>

                    <product_price>
                        <xsl:value-of select="price"></xsl:value-of>
                    </product_price>

                    <product_vat_price>
                        <xsl:value-of select="(price*0.2)+price"></xsl:value-of>
                    </product_vat_price>
                    
                </row>
            </xsl:for-each>

            <total_price>
                <xsl:value-of select="sum(/data/item/price)"></xsl:value-of>
            </total_price>

            <total_vat_price>
                <xsl:value-of select="format-number((sum(/data/item/price)*0.2+sum(/data/item/price)), '.1')"></xsl:value-of>
            </total_vat_price>

        </receipt>

    </xsl:template>
</xsl:transform>