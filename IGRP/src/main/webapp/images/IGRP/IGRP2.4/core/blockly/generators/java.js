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
 * @fileoverview Helper functions for generating Java for blocks.
 * @author fraser@google.com (Neil Fraser)
 */
'use strict';

goog.provide('Blockly.Java');

goog.require('Blockly.Generator');


/**
 * Java code generator.
 * @type {!Blockly.Generator}
 */
Blockly.Java = new Blockly.Generator('Java');

/**
 * List of illegal variable names.
 * This is not intended to be a security feature.  Blockly is 100% client-side,
 * so bypassing this list is trivial.  This is intended to prevent users from
 * accidentally clobbering a built-in object or function.
 * @private
 */
Blockly.Java.addReservedWords(
    //https://docs.oracle.com/javase/tutorial/java/nutsandbolts/_keywords.html
	'abstract,continue,for,new,switch,assert,default,goto,package,synchronized,boolean,do,if,private,this,break,double,implements,protected,throw,byte,else,import,public,throws,case,enum,instanceof,return,transient,catch,extends,int,short,try,char,final,interface,static,void,class,finally,long,strictfp,volatile,const,float,native,super,while'
);

/**
 * Order of operation ENUMs.
 *
 */
Blockly.Java.ORDER_ATOMIC = 0;         // 0 "" ...
Blockly.Java.ORDER_UNARY_POSTFIX = 1;  // expr++ expr--
Blockly.Java.ORDER_UNARY_PREFIX = 2;   // ++expr --expr +expr -expr ~ !
Blockly.Java.ORDER_MULTIPLICATIVE = 3; // * / %
Blockly.Java.ORDER_ADDITIVE = 4;       // + -
Blockly.Java.ORDER_SHIFT = 5;          // << >> >>>
Blockly.Java.ORDER_RELATIONAL = 6;     // < > <= >= instanceof
Blockly.Java.ORDER_EQUALITY = 7;       // == !=
Blockly.Java.ORDER_BITWISE_AND = 8;    // &
Blockly.Java.ORDER_BITWISE_XOR = 9;    // ^
Blockly.Java.ORDER_BITWISE_OR = 10;    // |
Blockly.Java.ORDER_LOGICAL_AND = 11;   // &&
Blockly.Java.ORDER_LOGICAL_OR = 12;    // ||
Blockly.Java.ORDER_TERNARY = 13;   	   // expr ? expr : expr
Blockly.Java.ORDER_ASSIGNMENT = 14;    // = += -= *= /= %= &= ^= |= <<= >>= >>>=
Blockly.Java.ORDER_NONE = 99;          // (...)

/**
 * Initialise the database of variable names.
 * @param {!Blockly.Workspace} workspace Workspace to generate code from.
 */
Blockly.Java.init = function(workspace) {
  // Create a dictionary of definitions to be printed before the code.
  Blockly.Java.definitions_ = Object.create(null);
  // Create a dictionary mapping desired function names in definitions_
  // to actual function names (to avoid collisions with user functions).
  Blockly.Java.functionNames_ = Object.create(null);

  if (!Blockly.Java.variableDB_) {
    Blockly.Java.variableDB_ =
        new Blockly.Names(Blockly.Java.RESERVED_WORDS_);
  } else {
    Blockly.Java.variableDB_.reset();
  }
  var defvars = [];
  var variables = Blockly.Variables.allVariables(workspace);
   for (var i = 0; i < variables.length; i++) {
    defvars[i] = 'var' +
        Blockly.Java.variableDB_.getName(variables[i],
        Blockly.Variables.NAME_TYPE) + ';';
  } 
  Blockly.Java.definitions_['variables'] = defvars.join('\n');  
};

/**
 * Prepend the generated code with the variable definitions.
 * @param {string} code Generated code.
 * @return {string} Completed code.
 */
Blockly.Java.finish = function(code) {
  // Convert the definitions dictionary into a list.
  var definitions = [];
  for (var name in Blockly.Java.definitions_) {
    definitions.push(Blockly.Java.definitions_[name]);
  }
  // Clean up temporary data.
  delete Blockly.Java.definitions_;
  delete Blockly.Java.functionNames_;
  Blockly.Java.variableDB_.reset();
  return definitions.join('\n\n') + '\n\n\n' + code;
};

/**
 * Naked values are top-level blocks with outputs that aren't plugged into
 * anything.  A trailing semicolon is needed to make this legal.
 * @param {string} line Line of generated code.
 * @return {string} Legal line of code.
 */
Blockly.Java.scrubNakedValue = function(line) {
  return line + ';\n';
};

/**
 * Encode a string as a properly escaped Java string, complete with
 * quotes.
 * @param {string} string Text to encode.
 * @return {string} Java string.
 * @private
 */
Blockly.Java.quote_ = function(string) {
  // TODO: This is a quick hack.  Replace with goog.string.quote
  string = string.replace(/\\/g, '\\\\')
                 .replace(/\n/g, '\\\n')
                 .replace(/'/g, '\\\'');
  return '\"' + string + '\"';
};

/**
 * Common tasks for generating Java from blocks.
 * Handles comments for the specified block and any connected value blocks.
 * Calls any statements following this block.
 * @param {!Blockly.Block} block The current block.
 * @param {string} code The Java code created for this block.
 * @return {string} Java code with comments and subsequent blocks added.
 * @private
 */
Blockly.Java.scrub_ = function(block, code) {
  var commentCode = '';
  // Only collect comments for blocks that aren't inline.
  if (!block.outputConnection || !block.outputConnection.targetConnection) {
    // Collect comment for this block.
    var comment = block.getCommentText();
    if (comment) {
      commentCode += Blockly.Java.prefixLines(comment, '// ') + '\n';
    }
    // Collect comments for all value arguments.
    // Don't collect comments for nested statements.
    for (var x = 0; x < block.inputList.length; x++) {
      if (block.inputList[x].type == Blockly.INPUT_VALUE) {
        var childBlock = block.inputList[x].connection.targetBlock();
        if (childBlock) {
          var comment = Blockly.Java.allNestedComments(childBlock);
          if (comment) {
            commentCode += Blockly.Java.prefixLines(comment, '// ');
          }
        }
      }
    }
  }
  var nextBlock = block.nextConnection && block.nextConnection.targetBlock();
  var nextCode = Blockly.Java.blockToCode(nextBlock);
  return commentCode + code + nextCode;
};
