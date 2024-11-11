<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <title>Synthèse des Informations Client</title>
                <link rel="stylesheet" href="style.css"/>
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lexend"/>
            </head>
            <body>
                <h1 class="title">Synthèse des Informations Client</h1>
                <hr/>
                <table>
                    <tr>
                        <th>Client</th>
                        <th>Nombre de Commandes</th>
                        <th>Total Dépensé</th>
                        <th>Dernier Commentaire</th>
                        <th>Note du Commentaire</th>
                    </tr>
                    <xsl:for-each select="BoiteBox/Client">
                        <tr>
                            <td>
                                <xsl:value-of select="Nom"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="Prenom"/>
                            </td>
                            <td>
                                <xsl:value-of select="count(../../Commande[ID_Client=current()/ID_Client])"/>
                            </td>
                            <td>
                                <xsl:value-of select="sum(../../Commande[ID_Client=current()/ID_Client]/Total)"/>
                            </td>
                            <td>
                                <xsl:for-each select="../../Commentaire[ID_Client=current()/ID_Client]">
                                    <xsl:sort select="ID_Commentaire" data-type="number" order="descending"/>
                                    <xsl:if test="position()=1">
                                        <xsl:value-of select="Texte"/>
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                            <td>
                                <xsl:for-each select="../../Commentaire[ID_Client=current()/ID_Client]">
                                    <xsl:sort select="ID_Commentaire" data-type="number" order="descending"/>
                                    <xsl:if test="position()=1">
                                        <xsl:value-of select="Note"/>
                                    </xsl:if>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <hr/>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
