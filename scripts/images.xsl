<?xml version="1.0" ?>
<xsl:transform version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:wix="http://schemas.microsoft.com/wix/2006/wi">

  <xsl:template match="wix:Wix">
    <xsl:comment>This file is auto-generated from heat.exe.  Do not edit it directly</xsl:comment>
    <xsl:copy>
      <xsl:apply-templates select="@*" />
      <xsl:apply-templates select="*" />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@*|*">
    <xsl:copy>
      <xsl:apply-templates select="@*" />
      <xsl:apply-templates select="*" />
    </xsl:copy>
  </xsl:template>

  <!-- Search directories for the components that will be removed. -->
  <xsl:key name="svn-search" match="wix:Directory[@Name = '.svn']" use="descendant::wix:Component/@Id" />

  <!-- Remove directories. -->
  <xsl:template match="wix:Directory[@Name='.svn']" />

  <!-- Remove componentsrefs referencing components in those directories. -->
  <xsl:template match="wix:ComponentRef[key('svn-search', @Id)]" />

</xsl:transform>
