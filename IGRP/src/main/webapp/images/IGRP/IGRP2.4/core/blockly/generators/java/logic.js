/**
 * Visual Blocks Language
 *
 * Copyright 2012 Google Inc.
 * http://blockly.googlecode.com/
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @fileoverview Generating Java for logic blocks.
 * @author mmendes.as@gmail.com  (Marcio Mendes)
 */
'use strict';

goog.provide('Blockly.Java.logic');

goog.require('Blockly.Java');


Blockly.Java.controls_if = function() {
  // If/elseif/else condition.
  var n = 0;
  var argument = Blockly.Java.valueToCode(this, 'IF' + n,
      Blockly.Java.ORDER_NONE) || 'false';
  var branch = Blockly.Java.statementToCode(this, 'DO' + n);
  var code = 'if (' + argument + ') {\n' + branch + '\n}';
  for (n = 1; n <= this.elseifCount_; n++) {
    argument = Blockly.Java.valueToCode(this, 'IF' + n,
      Blockly.Java.ORDER_NONE) || 'false';
    branch = Blockly.Java.statementToCode(this, 'DO' + n);
    code += ' else if (' + argument + ') {\n' + branch + '}';
  }
  if (this.elseCount_) {
    branch = Blockly.Java.statementToCode(this, 'ELSE');
    code += ' else {\n' + branch + '\n}';
  }
  return code + '\n';
};

Blockly.Java.logic_compare = function() {
  // Comparison operator.
  var mode = this.getFieldValue('OP');
  var operator = Blockly.Java.logic_compare.OPERATORS[mode];
  var order = (operator == '==' || operator == '!=') ?
      Blockly.Java.ORDER_EQUALITY : Blockly.Java.ORDER_RELATIONAL;
  var argument0 = Blockly.Java.valueToCode(this, 'A', order) || '0';
  var argument1 = Blockly.Java.valueToCode(this, 'B', order) || '0';
  var code = argument0 + ' ' + operator + ' ' + argument1;
  return [code, order];
};

Blockly.Java.logic_compare.OPERATORS = {
  EQ: '==',
  NEQ: '!=',
  LT: '<',
  LTE: '<=',
  GT: '>',
  GTE: '>='
};

Blockly.Java.logic_operation = function() {
  // Operations 'and', 'or'.
  var operator = (this.getFieldValue('OP') == 'AND') ? '&&' : '||';
  var order = (operator == '&&') ? Blockly.Java.ORDER_LOGICAL_AND :
      Blockly.Java.ORDER_LOGICAL_OR;
  var argument0 = Blockly.Java.valueToCode(this, 'A', order) || 'false';
  var argument1 = Blockly.Java.valueToCode(this, 'B', order) || 'false';
  var code = argument0 + ' ' + operator + ' ' + argument1;
  return [code, order];
};

Blockly.Java.logic_negate = function() {
  // Negation.
  var order = Blockly.Java.ORDER_UNARY_PREFIX;
  var argument0 = Blockly.Java.valueToCode(this, 'BOOL', order) || 'false';
  var code = '!' + argument0;
  return [code, order];
};

Blockly.Java.logic_boolean = function() {
  // Boolean values true and false.
  var code = (this.getFieldValue('BOOL') == 'TRUE') ? 'true' : 'false';
  return [code, Blockly.Java.ORDER_ATOMIC];
};

Blockly.Java.logic_null = function() {
  var code = 'NULL';
  return [code ,Blockly.Java.ORDER_ATOMIC];
};
