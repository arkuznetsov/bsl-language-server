/*
 * This file is a part of BSL Language Server.
 *
 * Copyright © 2018-2019
 * Alexey Sosnoviy <labotamy@gmail.com>, Nikita Gryzlov <nixel2007@gmail.com> and contributors
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
package com.github._1c_syntax.bsl.languageserver.context.symbol;

import lombok.Getter;
import org.antlr.v4.runtime.Token;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class MethodDescription {

  private final int startLine;
  private final int endLine;
  @Getter
  private final String description;

  public MethodDescription(List<Token> comments) {
    description = comments.stream()
      .map(Token::getText)
      .map(MethodDescription::uncomment)
      .collect(Collectors.joining("\n"));

    if (comments.isEmpty()) {
      startLine = 0;
      endLine = 0;
      return;
    }

    this.startLine = comments.get(0).getLine();
    this.endLine = comments.get(comments.size() - 1).getLine();
  }

  public boolean isEmpty() {
    return description.isEmpty();
  }

  public boolean contains(Token first, Token last) {
    int firstLine = first.getLine();
    int lastLine = last.getLine();
    return (firstLine >= startLine && lastLine <= endLine);
  }

  private static String uncomment(String text) {
    String result = text;
    if (result.startsWith("//")) {
      result = result.substring(2);
    }
    return result;
  }

}
