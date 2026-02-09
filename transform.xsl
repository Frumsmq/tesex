<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- ключ по преподавателю -->
    <xsl:key name="kTeacher" match="course" use="teacher"/>

    <!-- ключ по теме -->
    <xsl:key name="kTopic" match="course/topics/topic" use="."/>

    <xsl:template match="/">
        <html>
            <body>
                <h1>Наши курсы</h1>

                <h3>Курсы, которые читает Борисов И.О.</h3>
                <ul>
                    <xsl:for-each select="key('kTeacher','Борисов И.О.')">
                        <li>
                            <xsl:value-of select="title"/>
                        </li>
                    </xsl:for-each>
                </ul>

                <h3>Курсы, в которых используется XML</h3>
                <ul>
                    <xsl:for-each select="key('kTopic','XML')/../..">
                        <li>
                            <xsl:value-of select="title"/>
                        </li>
                    </xsl:for-each>
                </ul>

                <h3>Курсы Борисова И.О. с темой XSLT</h3>
                <ul>
                    <xsl:for-each select="key('kTeacher','Борисов И.О.')[
                        topics/topic='XSLT'
                    ]">
                        <li>
                            <xsl:value-of select="title"/>
                        </li>
                    </xsl:for-each>
                </ul>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
