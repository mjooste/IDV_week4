<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
<xsl:template match="/">
      <lineup>
        <xsl:apply-templates/>
      </lineup> 
</xsl:template>
    
<xsl:template match="band">
    <artist> 
        <xsl:apply-templates select="@id"/>
        <xsl:apply-templates select="@name"/>
        <xsl:apply-templates select="@genre"/>
        <xsl:apply-templates select="description"/>
        <gig>
            <xsl:apply-templates select="timeslot/@day"/>
            <time>
                <xsl:apply-templates select="timeslot/time/@start"/>
                <xsl:apply-templates select="timeslot/time/@end"/>
            </time>
        </gig>
        <xsl:apply-templates select="image/@src"/>
    </artist>
</xsl:template>       
    
    <xsl:template match="@id">
            <xsl:attribute name="id">
                <xsl:value-of select="."/>
            </xsl:attribute>
    </xsl:template> 
    
    <xsl:template match="@name">
        <name>    
          <xsl:value-of select="."/>
        </name>
    </xsl:template>
    
    <xsl:template match="@genre">
        <genre>
            <xsl:value-of select="."/>
        </genre>
    </xsl:template>
    
    <xsl:template match="description">   
        <writeup>
          <xsl:value-of select="."/>
        </writeup>
    </xsl:template>
  
    <xsl:template match="@day">
        <day>
          <xsl:value-of select="upper-case(.)"/>
        </day>

    </xsl:template>

    <xsl:template match="@start">:00
        <start>
          <xsl:value-of select="."/>
        </start>
    </xsl:template>
    
    <xsl:template match="@end">:00
        <end>
          <xsl:value-of select="."/>
        </end>
    </xsl:template>
    
    <xsl:template match="@src">
        <photo>
            <xsl:attribute name="format">
                <xsl:value-of select="substring-after( . , '.' )"/>
            </xsl:attribute>
                <xsl:value-of select="substring-before( . , '.' )"/>
        </photo>
    </xsl:template>
    

</xsl:stylesheet>
