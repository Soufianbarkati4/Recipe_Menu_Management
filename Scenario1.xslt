<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  

<!-- Ce Scenariot affiche tous les commentaires laissés par les clients pour une recette donnée. 
     Elle pourrait trier les commentaires par note, du plus haut au plus bas, 
     et inclure le nom du client et le texte du commentaire. Le résultat serait une page HTML  avec un tableau.
 -->

  <!-- Paramètre pour spécifier l'ID de la recette pour laquelle afficher les commentaires -->
  <xsl:param name="recetteID" select="'001'"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Commentaires des Clients</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lexend"/>
      </head>
      <body>
        <h1>Commentaires pour la Recette ID: <xsl:value-of select="$recetteID"/></h1>
        <table border="1">
          <tr>
            <th>Client</th>
            <th>Note</th>
            <th>Commentaire</th>
          </tr>
          <xsl:apply-templates select="BoiteBox/Commentaire[ID_Recette=$recetteID]">
            <xsl:sort select="Note" data-type="number" order="descending"/>
          </xsl:apply-templates>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="Commentaire">
    <tr>
      <td>
        <xsl:value-of select="/BoiteBox/Client[ID_Client=current()/ID_Client]/Nom"/>
      </td>
      <td>
        <xsl:value-of select="Note"/>
      </td>
      <td>
        <xsl:value-of select="Texte"/>
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>