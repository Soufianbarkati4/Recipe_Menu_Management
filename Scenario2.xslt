<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Ce scenariot affiche des statistiques de vente pour chaque menu, telles que le nombre de fois qu'un menu 
    a été commandé et le revenu total généré. Le résultat serait une page HTML 
    avec un tableau listant chaque menu, le nombre de commandes, et le revenu total.
 -->

    <xsl:template match="/">
        <html>
            <head>
                <title>Statistiques des Menus</title>
                <link rel="stylesheet" href="style.css"/>
                <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lexend"/>
            </head>
            <body>
                <h1 class="title">Statistiques des Ventes de Menus</h1>
                <hr/>
                <table>
                    <tr>
                        <th>Menu</th>
                        <th>Nombre de Commandes</th>
                        <th>Revenu Total</th>
                    </tr>
                    <xsl:for-each select="BoiteBox/Menu">
                        <xsl:variable name="currentMenuID" select="ID_Menu"/>
                        <tr>
                            <td><xsl:value-of select="Nom"/></td>
                            <td>
                                <xsl:value-of select="count(//Commande/Menus[ID_Menu=$currentMenuID])"/>
                            </td>
                            <td>
                                <xsl:value-of select="format-number(sum(//Commande[Menus/ID_Menu=$currentMenuID]/Total), '0.00')"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <hr/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
