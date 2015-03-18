<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:key name="client" match="data" use="@value"/>

<xsl:template match="/">
      <lineup>
        <xsl:apply-templates/>
      </lineup> 
</xsl:template>
    
<xsl:template match="client">
    <artist>
        <xsl:attribute name="id">
            <xsl:apply-templates select="data[@key='id']"/>
        </xsl:attribute>
        <name>
            <xsl:apply-templates select="data[@key='name']"/>
        </name>
        <genres>
            <xsl:apply-templates select="data[@key='genre']"/>
        </genres>
        <writeup>
            <xsl:apply-templates select="data[@key='description']"/>
        </writeup>
        <gig>
            <day>
                <xsl:apply-templates select="data[@key='performanceday']"/>
            </day>
            <time>
                <xsl:apply-templates select="data[@key='performancetime']"/>
            </time>
        </gig>
        <photo>
            <xsl:apply-templates select="data[@key='picture']"/>
        </photo>
    </artist>
</xsl:template>
   
<xsl:template match="data[@key='id']">
    <xsl:value-of select="@value"/>
</xsl:template>    
    
<xsl:template match="data[@key='name']">
    <xsl:value-of select="@value"/>
</xsl:template>

<xsl:template match="data[@key='genre']">
    <genre>
        <xsl:value-of select="substring-before(@value , '/')"/>
    </genre>
    <genre>
        <xsl:value-of select="substring-after(@value , '/')"/>
    </genre>
</xsl:template>    
    
<xsl:template match="data[@key='description']">
    <xsl:value-of select="@value"/>
</xsl:template>
    
<xsl:template match="data[@key='performanceday']">
    <xsl:value-of select="upper-case(@value)"/>
</xsl:template>

<xsl:template match="data[@key='performancetime']">
    <xsl:if test="substring(@value, 3, 2) = 'PM'">
        <start>
            <xsl:value-of select="number(substring(@value, 1, 2))+12"/>:00
        </start>
    </xsl:if>
    <xsl:if test="substring(@value, 3, 2) = 'AM'">
        <start>
            <xsl:value-of select="number(substring(@value, 1, 2))"/>:00
        </start>
    </xsl:if>
    
    <xsl:if test="substring(@value, 8, 2) = 'PM'">
        <end>
            <xsl:value-of select="number(substring(@value, 6, 2))+12"/>:00
        </end>
    </xsl:if>
    <xsl:if test="substring(@value, 8, 2) = 'AM'">
        <end>
            <xsl:value-of select="number(substring(@value, 6, 2))"/>:00
        </end>
    </xsl:if>
    
</xsl:template> 
    
<xsl:template match="data[@key='picture']">
    <xsl:attribute name="format">
        <xsl:value-of select="substring-after(@value , '.' )"/>
    </xsl:attribute>
        <xsl:value-of select="substring-before(@value , '.' )"/>
</xsl:template>    
    
</xsl:stylesheet>