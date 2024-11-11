<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <!-- Template principal -->
    <xsl:template match="/BoiteBox">
        <xsl:text>{&#xA;</xsl:text>
        <xsl:text>"Recettes": [</xsl:text>
        <xsl:apply-templates select="Recette"/>
        <xsl:text>]&#xA;</xsl:text>
        <xsl:text>"Menus": [</xsl:text>
        <xsl:apply-templates select="Menu"/>
        <xsl:text>]&#xA;</xsl:text>
        <xsl:text>"Commandes": [</xsl:text>
        <xsl:apply-templates select="Commande"/>
        <xsl:text>]&#xA;</xsl:text>
        <xsl:text>"Clients": [</xsl:text>
        <xsl:apply-templates select="Client"/>
        <xsl:text>]&#xA;</xsl:text>
        <xsl:text>"Livreurs": [</xsl:text>
        <xsl:apply-templates select="Livreur"/>
        <xsl:text>]&#xA;</xsl:text>
        <xsl:text>"Commentaires": [</xsl:text>
        <xsl:apply-templates select="Commentaire"/>
        <xsl:text>]&#xA;</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <!-- Template pour Recette -->
    <xsl:template match="Recette">
        <xsl:if test="position() > 1">,</xsl:if>
        <xsl:text>{&#xA;"ID_Recette": "</xsl:text><xsl:value-of select="ID_Recette"/><xsl:text>",&#xA;</xsl:text>
        <xsl:text>"Nom": "</xsl:text><xsl:value-of select="Nom"/><xsl:text>",&#xA;</xsl:text>
        <xsl:text>"Description": "</xsl:text><xsl:value-of select="Description"/><xsl:text>",&#xA;</xsl:text>
        <xsl:text>"Type": "</xsl:text><xsl:value-of select="Type"/><xsl:text>",&#xA;</xsl:text>
        <xsl:text>"Ingredients": [</xsl:text>
        <xsl:for-each select="Ingredients">
            <xsl:if test="position() > 1">,</xsl:if>
            <xsl:text>{&#xA;"ID_Ingredient": "</xsl:text><xsl:value-of select="ID_Ingredient"/><xsl:text>",&#xA;</xsl:text>
            <xsl:text>"Nom": "</xsl:text><xsl:value-of select="Nom"/><xsl:text>",&#xA;</xsl:text>
            <xsl:text>"Quantite": </xsl:text><xsl:value-of select="Quantite"/><xsl:text>,</xsl:text>
            <xsl:text>"Unite": "</xsl:text><xsl:value-of select="Unite"/><xsl:text>"&#xA;}</xsl:text>
        </xsl:for-each>
        <xsl:text>]&#xA;}</xsl:text>
    </xsl:template>

    <!-- Templates pour Menu, Commande, Client, Livreur, Commentaire -->
    <!-- Omettre pour la brièveté, mais suivre un modèle similaire à celui de Recette -->

</xsl:stylesheet>
