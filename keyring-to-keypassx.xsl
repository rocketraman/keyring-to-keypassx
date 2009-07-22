<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="xml"/>
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="pwlist">
    <database>
      <xsl:for-each-group select="pwentry" group-by="category">
        <group>
          <title>
            <xsl:value-of select="current-grouping-key()"/>
          </title>
          <icon>1</icon>
          <xsl:for-each select="current-group()">
            <entry>
              <xsl:apply-templates select="@*|node()"/>
            </entry>
          </xsl:for-each>
        </group>
      </xsl:for-each-group>
    </database>
  </xsl:template>

  <xsl:template match="notes">
    <comment>
      <xsl:apply-templates select="@*|node()"/>
    </comment>
  </xsl:template>

  <xsl:template match="lastmodtime">
    <lastmod>
      <xsl:apply-templates select="@*|node()"/>
    </lastmod>
  </xsl:template>
</xsl:stylesheet>
