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
 * @fileoverview Generating Java for list blocks.
 * @author fraser@google.com (Neil Fraser)
 */
'use strict';

goog.provide('Blockly.Java.lists');

goog.require('Blockly.Java');


Blockly.Java['lists_create_empty'] = function(block) {
  // Create an empty list.
  return ['[]', Blockly.Java.ORDER_ATOMIC];
};

Blockly.Java['lists_create_with'] = function(block) {
  // Create a list with any number of elements of any type.
  var code = new Array(block.itemCount_);
  for (var n = 0; n < block.itemCount_; n++) {
    code[n] = Blockly.Java.valueToCode(block, 'ADD' + n,
        Blockly.Java.ORDER_COMMA) || 'null';
  }
  code = '[' + code.join(', ') + ']';
  return [code, Blockly.Java.ORDER_ATOMIC];
};

Blockly.Java['lists_repeat'] = function(block) {
  // Create a list with one element repeated.
  var functionName = Blockly.Java.provideFunction_(
      'lists_repeat',
      [ 'Object[] ' + Blockly.Java.FUNCTION_NAME_PLACEHOLDER_ +
          '(value, n) {',
        '  var array = [];',
        '  for (var i = 0; i < n; i++) {',
        '    array[i] = value;',
        '  }',
        '  return array;',
        '}']);
  var argument0 = Blockly.Java.valueToCode(block, 'ITEM',
      Blockly.Java.ORDER_COMMA) || 'null';
  var argument1 = Blockly.Java.valueToCode(block, 'NUM',
      Blockly.Java.ORDER_COMMA) || '0';
  var code = functionName + '(' + argument0 + ', ' + argument1 + ')';
  return [code, Blockly.Java.ORDER_FUNCTION_CALL];
};

Blockly.Java['lists_length'] = function(block) {
  // String or array length.
  var argument0 = Blockly.Java.valueToCode(block, 'VALUE',
      Blockly.Java.ORDER_FUNCTION_CALL) || '[]';
  return [argument0 + '.length', Blockly.Java.ORDER_MEMBER];
};

Blockly.Java['lists_isEmpty'] = function(block) {
  // Is the string null or array empty?
  var argument0 = Blockly.Java.valueToCode(block, 'VALUE',
      Blockly.Java.ORDER_MEMBER) || '[]';
  return ['Arrays.asList(' + argument0 + ').isEmpty()', Blockly.Java.ORDER_LOGICAL_NOT];
};

Blockly.Java['lists_indexOf'] = function(block) {
  // Find an item in the list.
  var operator = block.getFieldValue('END') == 'FIRST' ?
      'indexOf' : 'lastIndexOf';
  var argument0 = Blockly.Java.valueToCode(block, 'FIND',
      Blockly.Java.ORDER_NONE) || '\'\'';
  var argument1 = Blockly.Java.valueToCode(block, 'VALUE',
      Blockly.Java.ORDER_MEMBER) || '[]';
  var code = 'Arrays.asList('+argument1 + ').' + operator + '(' + argument0 + ') + 1';
  return [code, Blockly.Java.ORDER_MEMBER];
};

Blockly.Java['lists_getIndex'] = function(block) {
  // Get element at index.
  // Note: Until January 2013 this block did not have MODE or WHERE inputs.
  var mode = block.getFieldValue('MODE') || 'GET';
  var where = block.getFieldValue('WHERE') || 'FROM_START';
  var at = Blockly.Java.valueToCode(block, 'AT',
      Blockly.Java.ORDER_UNARY_NEGATION) || '1';
  var list = Blockly.Java.valueToCode(block, 'VALUE',
      Blockly.Java.ORDER_MEMBER) || '[]';

  if (where == 'FIRST') {
    if (mode == 'GET') {
      var code = 'Arrays.asList(' + list + ').get(0)';
      return [code, Blockly.Java.ORDER_MEMBER];
    } else if (mode == 'GET_REMOVE') {
      var code = 'Arrays.asList(' + list + ').get(0);\n' + 
		  		 'Arrays.asList(' + list + ').removeAt(0)';
      return [code, Blockly.Java.ORDER_MEMBER];
    } else if (mode == 'REMOVE') {
      return 'Arrays.asList(' + list + ').removeAt(0);\n';
    }
  } else if (where == 'LAST') {
    if (mode == 'GET') {
      var code = list + '.slice(-1)[0]';
      return [code, Blockly.Java.ORDER_MEMBER];
    } else if (mode == 'GET_REMOVE') {
      var code = 'Arrays.asList(' + list + ').get(' + list + '.length - 1);\n' + 
		         'Arrays.asList(' + list + ').removeAt(' + list + '.length - 1);\n';
      return [code, Blockly.Java.ORDER_MEMBER];
    } else if (mode == 'REMOVE') {
      return 'Arrays.asList(' + list + ').removeAt(' + list + '.length - 1);\n';
    }
  } else if (where == 'FROM_START') {
    // Blockly uses one-based indicies.
    if (Blockly.isNumber(at)) {
      // If the index is a naked number, decrement it right now.
      at = parseFloat(at) - 1;
    } else {
      // If the index is dynamic, decrement it in code.
      at += ' - 1';
    }
    if (mode == 'GET') {
      var code = 'Arrays.asList(' + list + ').get(' + at + ')';
      return [code, Blockly.Java.ORDER_MEMBER];
    } else if (mode == 'GET_REMOVE') {
      var code ='Arrays.asList(' + list + ').get(' + at +');\n' + 
		  		'Arrays.asList(' + list + ').removeAt(' + at +')';
      return [code, Blockly.Java.ORDER_FUNCTION_CALL];
    } else if (mode == 'REMOVE') {
      return 'Arrays.asList(' + list + ').removeAt(' + at +');\n';
    }
  }
  throw 'Unhandled or Not implemented combination (lists_getIndex).';
};

Blockly.Java['lists_setIndex'] = function(block) {
  // Set element at index.
  // Note: Until February 2013 this block did not have MODE or WHERE inputs.
  var list = Blockly.Java.valueToCode(block, 'LIST',
      Blockly.Java.ORDER_MEMBER) || '[]';
  var mode = block.getFieldValue('MODE') || 'GET';
  var where = block.getFieldValue('WHERE') || 'FROM_START';
  var at = Blockly.Java.valueToCode(block, 'AT',
      Blockly.Java.ORDER_NONE) || '1';
  var value = Blockly.Java.valueToCode(block, 'TO',
      Blockly.Java.ORDER_ASSIGNMENT) || 'null';
  // Cache non-trivial values to variables to prevent repeated look-ups.
  // Closure, which accesses and modifies 'list'.
  function cacheList() {
    if (list.match(/^\w+$/)) {
      return '';
    }
    var listVar = Blockly.Java.variableDB_.getDistinctName(
        'tmp_list', Blockly.Variables.NAME_TYPE);
    var code = 'var ' + listVar + ' = ' + list + ';\n';
    list = listVar;
    return code;
  }
  if (where == 'FIRST') {
    if (mode == 'SET' || mode == 'INSERT') {
      return 'Arrays.asList(' + list + ').set(0, ' + value + ');\n';
    }
  } else if (where == 'LAST') {
    if (mode == 'SET') {
      var code = cacheList();
      code += list + '[' + list + '.length - 1] = ' + value + ';\n';
      return code;
    } else if (mode == 'INSERT') {
      return 'Arrays.asList(' + list + ').set(' + list + '.length - 1, ' +value + ');'
    }
  } else if (where == 'FROM_START') {
    // Blockly uses one-based indicies.
    if (Blockly.isNumber(at)) {
      // If the index is a naked number, decrement it right now.
      at = parseFloat(at) - 1;
    } else {
      // If the index is dynamic, decrement it in code.
      at += ' - 1';
    }
    if (mode == 'SET') {
      return list + '[' + at + '] = ' + value + ';\n';
    } else if (mode == 'INSERT') {      
	  return 'Arrays.asList(' + list + ').set(' + at + ', ' +value + ');'
    }
  }
  throw 'Unhandled combination or Not Implemented (lists_setIndex).';
};

Blockly.Java['lists_getSublist'] = function(block) {
  // Get sublist.
  var list = Blockly.Java.valueToCode(block, 'LIST',
      Blockly.Java.ORDER_MEMBER) || '[]';
  var at1 = Blockly.Java.valueToCode(block, 'AT1',
      Blockly.Java.ORDER_NONE) || '1';
  var at2 = Blockly.Java.valueToCode(block, 'AT2',
      Blockly.Java.ORDER_NONE) || '1';
	
  var code = 'Arrays.asList(' + list + ').subList(' + at1 + ', ' + at2 + ')'  
  return [code, Blockly.Java.ORDER_FUNCTION_CALL];
};

Blockly.Java['lists_split'] = function(block) {
  // Block for splitting text into a list, or joining a list into text.
  var value_input = Blockly.Java.valueToCode(block, 'INPUT',
      Blockly.Java.ORDER_MEMBER);
  var value_delim = Blockly.Java.valueToCode(block, 'DELIM',
      Blockly.Java.ORDER_NONE) || '\'\'';
  var mode = block.getFieldValue('MODE');
  if (mode == 'SPLIT') {
    if (!value_input) {
      value_input = '\'\'';
    }
    var functionName = 'split';
  } else {
    throw 'Unknown mode: ' + mode;
  }
  var code = value_input + '.' + functionName + '(' + value_delim + ')';
  return [code, Blockly.Java.ORDER_FUNCTION_CALL];
};
