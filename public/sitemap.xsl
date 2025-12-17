<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
                xmlns:html="http://www.w3.org/1999/xhtml"
                xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>XML Sitemap - 0xdpslabs</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <style type="text/css">
          * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
          }
          
          body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #ffffff;
            color: #0a4534;
            padding: 2rem;
            line-height: 1.6;
          }
          
          @media (prefers-color-scheme: dark) {
            body {
              background: #0a1410;
              color: #2dd4bf;
            }
            
            a {
              color: #2dd4bf;
            }
            
            table {
              border-color: #0f5e48;
            }
            
            th {
              background: #0f5e48;
              color: #2dd4bf;
            }
            
            tr:nth-child(even) {
              background: rgba(15, 94, 72, 0.1);
            }
          }
          
          .container {
            max-width: 1200px;
            margin: 0 auto;
          }
          
          h1 {
            font-size: 2.5rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: inherit;
          }
          
          .subtitle {
            color: #0f5e48;
            margin-bottom: 2rem;
            font-size: 1.1rem;
          }
          
          @media (prefers-color-scheme: dark) {
            .subtitle {
              color: #a3a3a3;
            }
          }
          
          .info {
            background: rgba(20, 184, 166, 0.1);
            padding: 1.5rem;
            border-left: 3px solid #14b8a6;
            margin-bottom: 2rem;
            border-radius: 4px;
          }
          
          .info p {
            margin-bottom: 0.5rem;
          }
          
          table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 2rem;
            background: #ffffff;
            border: 1px solid #e5e5e5;
          }
          
          @media (prefers-color-scheme: dark) {
            table {
              background: transparent;
            }
          }
          
          th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #e5e5e5;
          }
          
          th {
            background: #14b8a6;
            color: #ffffff;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.875rem;
            letter-spacing: 0.05em;
          }
          
          tr:nth-child(even) {
            background: #fafafa;
          }
          
          tr:hover {
            background: rgba(20, 184, 166, 0.05);
          }
          
          a {
            color: #14b8a6;
            text-decoration: none;
            border-bottom: 1px solid transparent;
            transition: all 0.2s ease;
          }
          
          a:hover {
            border-bottom-color: #14b8a6;
            color: #0d9488;
          }
          
          .url-cell {
            max-width: 500px;
            word-break: break-all;
          }
          
          .priority-high {
            color: #10b981;
            font-weight: 600;
          }
          
          .priority-medium {
            color: #f59e0b;
          }
          
          .priority-low {
            color: #737373;
          }
          
          @media (max-width: 768px) {
            body {
              padding: 1rem;
            }
            
            h1 {
              font-size: 1.75rem;
            }
            
            table {
              font-size: 0.875rem;
            }
            
            th, td {
              padding: 0.75rem 0.5rem;
            }
          }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>XML Sitemap</h1>
          <p class="subtitle">0xdpslabs.dev</p>
          
          <div class="info">
            <p><strong>What is this?</strong></p>
            <p>This is an XML Sitemap that search engines use to crawl and index the site more efficiently. It contains <strong><xsl:value-of select="count(sitemap:urlset/sitemap:url)"/> URLs</strong>.</p>
            <p>Learn more about XML sitemaps at <a href="https://www.sitemaps.org" target="_blank">sitemaps.org</a>.</p>
          </div>
          
          <table>
            <thead>
              <tr>
                <th>URL</th>
                <th>Priority</th>
                <th>Change Frequency</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="sitemap:urlset/sitemap:url">
                <tr>
                  <td class="url-cell">
                    <a href="{sitemap:loc}">
                      <xsl:value-of select="sitemap:loc"/>
                    </a>
                  </td>
                  <td>
                    <xsl:choose>
                      <xsl:when test="sitemap:priority &gt;= 0.8">
                        <span class="priority-high"><xsl:value-of select="sitemap:priority"/></span>
                      </xsl:when>
                      <xsl:when test="sitemap:priority &gt;= 0.5">
                        <span class="priority-medium"><xsl:value-of select="sitemap:priority"/></span>
                      </xsl:when>
                      <xsl:otherwise>
                        <span class="priority-low"><xsl:value-of select="sitemap:priority"/></span>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td><xsl:value-of select="sitemap:changefreq"/></td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
