<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
<xsl:template match="/">
      <lineup>
        <xsl:apply-templates/>
      </lineup> 
</xsl:template>
    
<xsl:template match="artist">
    <artist> 
        <xsl:apply-templates select="id"/>
        <xsl:apply-templates select="name"/>
        <genres>
            <xsl:apply-templates select="genres/g"/>
        </genres>
        <xsl:apply-templates select="description"/>
        <gig>
            <xsl:apply-templates select="time/day"/>            
            <time>
                <xsl:apply-templates select="time/time"/>
                <xsl:apply-templates select="timeslot/time/@end"/>
            </time>
        </gig>
        <xsl:apply-templates select="image"/>
    </artist>
</xsl:template>       
    
    <xsl:template match="id">
        <xsl:attribute name="id">
                <xsl:value-of select="translate(.,'BCD','123')"/>
        </xsl:attribute>
    </xsl:template> 
    
    <xsl:template match="name">
        <name>    
          <xsl:value-of select="."/>
        </name>
    </xsl:template>
    
    <xsl:template match="genres/g">
            <genre>
            <xsl:value-of select="."/>
            </genre>
    </xsl:template>
    
    <xsl:template match="description">   
        <writeup>
          <xsl:value-of select="."/>
        </writeup>
    </xsl:template>
  
    <xsl:template match="day">
        <day>
          <xsl:value-of select="upper-case(.)"/>
        </day>
    </xsl:template>

    <xsl:template match="time">
        <start>
          <xsl:value-of select="substring-before(. , '-')"/>
        </start>
        <end>
          <xsl:value-of select="substring-after(. , '-')"/>
        </end>
    </xsl:template>
    
    <xsl:template match="image">
        <photo>
            <xsl:attribute name="format">
                <xsl:value-of select="substring-after( . , '.' )"/>
            </xsl:attribute>
                <xsl:value-of select="substring-before( . , '.' )"/>
        </photo>
    </xsl:template>
    

</xsl:stylesheet>
