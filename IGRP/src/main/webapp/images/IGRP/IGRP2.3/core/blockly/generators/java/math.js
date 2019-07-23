/**
 * @license
 * Visual Blocks Language
 *
 * Copyright 2012 Google Inc.
 * https://developers.google.com/blockly/
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
 * @fileoverview Generating Java for math blocks.
 * @author q.neutron@gmail.com (Quynh Neutron)
 */
'use strict';

goog.provide('Blockly.Java.math');

goog.require('Blockly.Java');


Blockly.Java['math_number'] = function(block) {
  // Numeric value.
  var code = parseFloat(block.getFieldValue('NUM'));
  return [code, Blockly.Java.ORDER_ATOMIC];
};

Blockly.Java['math_arithmetic'] = function(block) {
  // Basic arithmetic operators, and power.
  var OPERATORS = {
    'ADD': [' + ', Blockly.Java.ORDER_ADDITION],
    'MINUS': [' - ', Blockly.Java.ORDER_SUBTRACTION],
    'MULTIPLY': [' * ', Blockly.Java.ORDER_MULTIPLICATION],
    'DIVIDE': [' / ', Blockly.Java.ORDER_DIVISION],
    'POWER': [null, Blockly.Java.ORDER_COMMA]  // Handle power separately.
  };
  var tuple = OPERATORS[block.getFieldValue('OP')];
  var operator = tuple[0];
  var order = tuple[1];
  var argument0 = Blockly.Java.valueToCode(block, 'A', order) || '0';
  var argument1 = Blockly.Java.valueToCode(block, 'B', order) || '0';
  var code;
  // Power in Java requires a special case since it has no operator.
  if (!operator) {
    code = 'Math.pow(' + argument0 + ', ' + argument1 + ')';
    return [code, Blockly.Java.ORDER_FUNCTION_CALL];
  }
  code = argument0 + operator + argument1;
  return [code, order];
};

Blockly.Java['math_single'] = function(block) {
  // Math operators with single operand.
  var operator = block.getFieldValue('OP');
  var code;
  var arg;
  if (operator == 'NEG') {
    // Negation is a special case given its different operator precedence.
    arg = Blockly.Java.valueToCode(block, 'NUM',
        Blockly.Java.ORDER_UNARY_NEGATION) || '0';
    if (arg[0] == '-') {
      // --3 is not legal in JS.
      arg = ' ' + arg;
    }
    code = '-' + arg;
    return [code, Blockly.Java.ORDER_UNARY_NEGATION];
  }
  if (operator == 'SIN' || operator == 'COS' || operator == 'TAN') {
    arg = Blockly.Java.valueToCode(block, 'NUM',
        Blockly.Java.ORDER_DIVISION) || '0';
  } else {
    arg = Blockly.Java.valueToCode(block, 'NUM',
        Blockly.Java.ORDER_NONE) || '0';
  }
  // First, handle cases which generate values that don't need parentheses
  // wrapping the code.
  switch (operator) {
    case 'ABS':
      code = 'Math.abs(' + arg + ')';
      break;
    case 'ROOT':
      code = 'Math.sqrt(' + arg + ')';
      break;
    case 'LN':
      code = 'Math.log(' + arg + ')';
      break;
    case 'EXP':
      code = 'Math.exp(' + arg + ')';
      break;
    case 'POW10':
      code = 'Math.pow(10,' + arg + ')';
      break;
    case 'ROUND':
      code = 'Math.round(' + arg + ')';
      break;
    case 'ROUNDUP':
      code = 'Math.ceil(' + arg + ')';
      break;
    case 'ROUNDDOWN':
      code = 'Math.floor(' + arg + ')';
      break;
    case 'SIN':
      code = 'Math.sin(' + arg + ' / 180 * Math.PI)';
      break;
    case 'COS':
      code = 'Math.cos(' + arg + ' / 180 * Math.PI)';
      break;
    case 'TAN':
      code = 'Math.tan(' + arg + ' / 180 * Math.PI)';
      break;
  }
  if (code) {
    return [code, Blockly.Java.ORDER_FUNCTION_CALL];
  }
  // Second, handle cases which generate values that may need parentheses
  // wrapping the code.
  switch (operator) {
    case 'LOG10':
      code = 'Math.log(' + arg + ') / Math.log(10)';
      break;
    case 'ASIN':
      code = 'Math.asin(' + arg + ') / Math.PI * 180';
      break;
    case 'ACOS':
      code = 'Math.acos(' + arg + ') / Math.PI * 180';
      break;
    case 'ATAN':
      code = 'Math.atan(' + arg + ') / Math.PI * 180';
      break;
    default:
      throw 'Unknown math operator: ' + operator;
  }
  return [code, Blockly.Java.ORDER_DIVISION];
};

Blockly.Java['math_constant'] = function(block) {
  // Constants: PI, E, the Golden Ratio, sqrt(2), 1/sqrt(2), INFINITY.
  var CONSTANTS = {
    'PI': ['Math.PI', Blockly.Java.ORDER_MEMBER],
    'E': ['Math.E', Blockly.Java.ORDER_MEMBER],
    'GOLDEN_RATIO':
        ['(1 + Math.sqrt(5)) / 2', Blockly.Java.ORDER_DIVISION],
    'SQRT2': ['Math.sqrt(2)', Blockly.Java.ORDER_MEMBER],
    'SQRT1_2': ['Math.sqrt(1/2)', Blockly.Java.ORDER_MEMBER],
    'INFINITY': ['Double.POSITIVE_INFINITY', Blockly.Java.ORDER_ATOMIC]
  };
  return CONSTANTS[block.getFieldValue('CONSTANT')];
};

Blockly.Java['math_number_property'] = function(block) {
  // Check if a number is even, odd, prime, whole, positive, or negative
  // or if it is divisible by certain number. Returns true or false.
  var number_to_check = Blockly.Java.valueToCode(block, 'NUMBER_TO_CHECK',
      Blockly.Java.ORDER_MODULUS) || '0';
  var dropdown_property = block.getFieldValue('PROPERTY');
  var code;
  if (dropdown_property == 'PRIME') {
    // Prime is a special case as it is not a one-liner test.
    var functionName = Blockly.Java.provideFunction_(
        'math_isPrime',
        [ 'boolean ' + Blockly.Java.FUNCTION_NAME_PLACEHOLDER_ + '(int n) {',          
          '  for(int i = 2; i < n; i++){',
          '    if(n % i == 0) return false;',
          '  }',
          '  return true;',
          '}']);
    code = functionName + '(' + number_to_check + ')';
    return [code, Blockly.Java.ORDER_FUNCTION_CALL];
  }
  switch (dropdown_property) {
    case 'EVEN':
      code = number_to_check + ' % 2 == 0';
      break;
    case 'ODD':
      code = number_to_check + ' % 2 == 1';
      break;
    case 'WHOLE':
      code = number_to_check + ' % 1 == 0';
      break;
    case 'POSITIVE':
      code = number_to_check + ' > 0';
      break;
    case 'NEGATIVE':
      code = number_to_check + ' < 0';
      break;
    case 'DIVISIBLE_BY':
      var divisor = Blockly.Java.valueToCode(block, 'DIVISOR',
          Blockly.Java.ORDER_MODULUS) || '0';
      code = number_to_check + ' % ' + divisor + ' == 0';
      break;
  }
  return [code, Blockly.Java.ORDER_EQUALITY];
};

Blockly.Java['math_change'] = function(block) {
  // Add to a variable in place.
  var argument0 = Blockly.Java.valueToCode(block, 'DELTA',
      Blockly.Java.ORDER_ADDITION) || '0';
  var varName = Blockly.Java.variableDB_.getName(
      block.getFieldValue('VAR'), Blockly.Variables.NAME_TYPE);
  return varName + ' = (typeof(' + varName + ') == \'number\' ? ' + varName +
      ' : 0) + ' + argument0 + ';\n';
};

// Rounding functions have a single operand.
Blockly.Java['math_round'] = Blockly.Java['math_single'];
// Trigonometry functions have a single operand.
Blockly.Java['math_trig'] = Blockly.Java['math_single'];

Blockly.Java['math_modulo'] = function(block) {
  // Remainder computation.
  var argument0 = Blockly.Java.valueToCode(block, 'DIVIDEND',
      Blockly.Java.ORDER_MODULUS) || '0';
  var argument1 = Blockly.Java.valueToCode(block, 'DIVISOR',
      Blockly.Java.ORDER_MODULUS) || '0';
  var code = argument0 + ' % ' + argument1;
  return [code, Blockly.Java.ORDER_MODULUS];
};

Blockly.Java['math_constrain'] = function(block) {
  // Constrain a number between two limits.
  var argument0 = Blockly.Java.valueToCode(block, 'VALUE',
      Blockly.Java.ORDER_COMMA) || '0';
  var argument1 = Blockly.Java.valueToCode(block, 'LOW',
      Blockly.Java.ORDER_COMMA) || '0';
  var argument2 = Blockly.Java.valueToCode(block, 'HIGH',
      Blockly.Java.ORDER_COMMA) || 'Infinity';
  var code = 'Math.min(Math.max(' + argument0 + ', ' + argument1 + '), ' +
      argument2 + ')';
  return [code, Blockly.Java.ORDER_FUNCTION_CALL];
};

Blockly.Java['math_random_int'] = function(block) {
  // Random integer between [X] and [Y].
  var argument0 = Blockly.Java.valueToCode(block, 'FROM',
      Blockly.Java.ORDER_COMMA) || '0';
  var argument1 = Blockly.Java.valueToCode(block, 'TO',
      Blockly.Java.ORDER_COMMA) || '0';
  var functionName = Blockly.Java.provideFunction_(
      'math_random_int',
      [ 'int ' + Blockly.Java.FUNCTION_NAME_PLACEHOLDER_ + '(min, max) {',
        '  return new Random().nextInt((max - min) + 1) + min;',        
        '}']);
  var code = functionName + '(' + argument0 + ', ' + argument1 + ')';
  return [code, Blockly.Java.ORDER_FUNCTION_CALL];
};

Blockly.Java['math_random_float'] = function(block) {
  // Random fraction between 0 and 1.
  return ['Math.random()', Blockly.Java.ORDER_FUNCTION_CALL];
};
