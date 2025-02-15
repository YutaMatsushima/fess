/*
 * Copyright 2012-2019 CodeLibs Project and the Others.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific language
 * governing permissions and limitations under the License.
 */
package org.codelibs.fess.taglib;

import java.util.Date;

import org.codelibs.fess.unit.UnitFessTestCase;

public class FessFunctionsTest extends UnitFessTestCase {
    public void test_formatNumber() {
        assertEquals("0", FessFunctions.formatNumber(0, "###,###"));
        assertEquals("1,000", FessFunctions.formatNumber(1000, "###,###"));
        assertEquals("1,000,000", FessFunctions.formatNumber(1000000, "###,###"));
    }

    public void test_formatFileSize() {
        assertEquals("0", FessFunctions.formatFileSize(0));
        assertEquals("1000", FessFunctions.formatFileSize(1000));
        assertEquals("976.6K", FessFunctions.formatFileSize(1000000));
        assertEquals("953.7M", FessFunctions.formatFileSize(1000000000));
        assertEquals("931.3G", FessFunctions.formatFileSize(1000000000000L));
        assertEquals("909.5T", FessFunctions.formatFileSize(1000000000000000L));
    }

    public void test_parseDate() {
        Date date;

        date = FessFunctions.parseDate("");
        assertNull(date);

        date = FessFunctions.parseDate("2004-04-01T12:34:56.123Z");
        assertEquals("2004-04-01T12:34:56.123Z", FessFunctions.formatDate(date));

        date = FessFunctions.parseDate("2004-04-01T12:34:56Z");
        assertEquals("2004-04-01T12:34:56.000Z", FessFunctions.formatDate(date));

        date = FessFunctions.parseDate("2004-04-01T12:34Z");
        assertEquals("2004-04-01T12:34:00.000Z", FessFunctions.formatDate(date));

        date = FessFunctions.parseDate("2004-04-01");
        assertEquals("2004-04-01T00:00:00.000Z", FessFunctions.formatDate(date));

        date = FessFunctions.parseDate("2004-04-01T12:34:56.123+09:00");
        assertEquals("2004-04-01T03:34:56.123Z", FessFunctions.formatDate(date));

        date = FessFunctions.parseDate("D:20040401033456-05'00'", "pdf_date");
        assertEquals("2004-04-01T08:34:56.000Z", FessFunctions.formatDate(date));
    }
}
