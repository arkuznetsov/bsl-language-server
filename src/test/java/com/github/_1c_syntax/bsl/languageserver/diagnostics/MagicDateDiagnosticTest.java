/*
 * This file is a part of BSL Language Server.
 *
 * Copyright (c) 2018-2022
 * Alexey Sosnoviy <labotamy@gmail.com>, Nikita Fedkin <nixel2007@gmail.com> and contributors
 *
 * SPDX-License-Identifier: LGPL-3.0-or-later
 *
 * BSL Language Server is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3.0 of the License, or (at your option) any later version.
 *
 * BSL Language Server is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with BSL Language Server.
 */
package com.github._1c_syntax.bsl.languageserver.diagnostics;

import org.eclipse.lsp4j.Diagnostic;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

import static com.github._1c_syntax.bsl.languageserver.util.Assertions.assertThat;

class MagicDateDiagnosticTest extends AbstractDiagnosticTest<MagicDateDiagnostic> {
  MagicDateDiagnosticTest() {
    super(MagicDateDiagnostic.class);
  }

  @Test
  void test() {

    List<Diagnostic> diagnostics = getDiagnostics();

    assertThat(diagnostics).hasSize(5);
    assertThat(diagnostics, true)
      .hasRange(1, 12, 1, 22)
      .hasRange(2, 12, 2, 28)
      .hasRange(3, 7, 3, 17)
      .hasRange(4, 14, 4, 24)
      .hasRange(13, 7, 13, 26);

  }

  @Test
  void testConfigure() {

    Map<String, Object> configuration = diagnosticInstance.getInfo().getDefaultConfiguration();
    configuration.put("authorizedDates", "00010101,00010101000000,000101010000,12340101, 00020101   ,,");
    diagnosticInstance.configure(configuration);

    List<Diagnostic> diagnostics = getDiagnostics();

    assertThat(diagnostics).hasSize(3);
    assertThat(diagnostics, true)
      .hasRange(2, 12, 2, 28)
      .hasRange(3, 7, 3, 17)
      .hasRange(13, 7, 13, 26);

  }
}
