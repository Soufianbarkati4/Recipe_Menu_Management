<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <!-- Le template racine crée un nouvel élément racine 'BoiteBoxStructure' -->
    <xsl:template match="/BoiteBox">
        <BoiteBoxStructure>
            <!-- Création de la structure regroupée pour Recettes -->
            <Recettes>
                <xsl:apply-templates select="Recette"/>
            </Recettes>
            <!-- Création de la structure regroupée pour Menus -->
            <Menus>
                <xsl:apply-templates select="Menu"/>
            </Menus>
            <!-- Création de la structure regroupée pour Commandes -->
            <Commandes>
                <xsl:apply-templates select="Commande"/>
            </Commandes>
            <!-- Création de la structure regroupée pour Clients -->
            <Clients>
                <xsl:apply-templates select="Client"/>
            </Clients>
            <!-- Création de la structure regroupée pour Livreurs -->
            <Livreurs>
                <xsl:apply-templates select="Livreur"/>
            </Livreurs>
            <!-- Création de la structure regroupée pour Commentaires -->
            <Commentaires>
                <xsl:apply-templates select="Commentaire"/>
            </Commentaires>
        </BoiteBoxStructure>
    </xsl:template>

    <!-- Template pour Recette qui conserve la structure mais regroupe les ingrédients -->
    <xsl:template match="Recette">
        <RecetteStructure>
            <ID_Recette><xsl:value-of select="ID_Recette"/></ID_Recette>
            <Nom><xsl:value-of select="Nom"/></Nom>
            <Type><xsl:value-of select="Type"/></Type>
            <Description><xsl:value-of select="Description"/></Description>
            <Ingredients>
                <xsl:apply-templates select="Ingredients"/>
            </Ingredients>
        </RecetteStructure>
    </xsl:template>

    <!-- Template pour Menu qui conserve la structure originale -->
    <xsl:template match="Menu">
        <!-- Structure simplifiée pour le Menu -->
        <MenuStructure>
            <xsl:copy-of select="."/>
        </MenuStructure>
    </xsl:template>

    <!-- Template pour Commande qui conserve la structure originale -->
    <xsl:template match="Commande">
        <!-- Structure simplifiée pour la Commande -->
        <CommandeStructure>
            <xsl:copy-of select="."/>
        </CommandeStructure>
    </xsl:template>

    <!-- Template pour Client qui conserve la structure originale -->
    <xsl:template match="Client">
        <!-- Structure simplifiée pour le Client -->
        <ClientStructure>
            <xsl:copy-of select="."/>
        </ClientStructure>
    </xsl:template>

    <!-- Template pour Livreur qui conserve la structure originale -->
    <xsl:template match="Livreur">
        <!-- Structure simplifiée pour le Livreur -->
        <LivreurStructure>
            <xsl:copy-of select="."/>
        </LivreurStructure>
    </xsl:template>

    <!-- Template pour Commentaire qui conserve la structure originale -->
    <xsl:template match="Commentaire">
        <!-- Structure simplifiée pour le Commentaire -->
        <CommentaireStructure>
            <xsl:copy-of select="."/>
        </CommentaireStructure>
    </xsl:template>

</xsl:stylesheet>
