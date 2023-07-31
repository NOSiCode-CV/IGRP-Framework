var CM_XSLT_tags = {
    "!top": [
      "xsl:stylesheet"
    ],
    "xsl:declaration": {
      "attrs": {
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      }
    },
    "xsl:instruction": {
      "attrs": {
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      }
    },
    "xsl:analyze-string": {
      "attrs": {
        "select": null,
        "regex": null,
        "flags": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:matching-substring",
        "xsl:non-matching-substring",
        "xsl:fallback"
      ]
    },
    "xsl:apply-imports": {
      "attrs": {
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:with-param"
      ]
    },
    "xsl:apply-templates": {
      "attrs": {
        "select": null,
        "mode": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:sort",
        "xsl:with-param"
      ]
    },
    "xsl:attribute": {
      "attrs": {
        "name": null,
        "namespace": null,
        "select": null,
        "separator": null,
        "type": null,
        "validation": [
          "strict",
          "lax",
          "preserve",
          "strip"
        ],
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:attribute-set": {
      "attrs": {
        "name": null,
        "use-attribute-sets": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:attribute"
      ]
    },
    "xsl:call-template": {
      "attrs": {
        "name": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:with-param"
      ]
    },
    "xsl:character-map": {
      "attrs": {
        "name": null,
        "use-character-maps": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:output-character"
      ]
    },
    "xsl:choose": {
      "attrs": {
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:when",
        "xsl:otherwise"
      ]
    },
    "xsl:comment": {
      "attrs": {
        "select": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:copy": {
      "attrs": {
        "copy-namespaces": [
          "yes",
          "no"
        ],
        "inherit-namespaces": [
          "yes",
          "no"
        ],
        "use-attribute-sets": null,
        "type": null,
        "validation": [
          "strict",
          "lax",
          "preserve",
          "strip"
        ],
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:copy-of": {
      "attrs": {
        "select": null,
        "copy-namespaces": [
          "yes",
          "no"
        ],
        "type": null,
        "validation": [
          "strict",
          "lax",
          "preserve",
          "strip"
        ],
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      }
    },
    "xsl:document": {
      "attrs": {
        "type": null,
        "validation": [
          "strict",
          "lax",
          "preserve",
          "strip"
        ],
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:decimal-format": {
      "attrs": {
        "name": null,
        "decimal-separator": null,
        "grouping-separator": null,
        "infinity": null,
        "minus-sign": null,
        "NaN": null,
        "percent": null,
        "per-mille": null,
        "zero-digit": null,
        "digit": null,
        "pattern-separator": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      }
    },
    "xsl:element": {
      "attrs": {
        "name": null,
        "namespace": null,
        "inherit-namespaces": [
          "yes",
          "no"
        ],
        "use-attribute-sets": null,
        "type": null,
        "validation": [
          "strict",
          "lax",
          "preserve",
          "strip"
        ],
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:fallback": {
      "attrs": {
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:for-each": {
      "attrs": {
        "select": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:sort",
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:for-each-group": {
      "attrs": {
        "select": null,
        "group-by": null,
        "group-adjacent": null,
        "group-starting-with": null,
        "group-ending-with": null,
        "collation": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:sort",
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:function": {
      "attrs": {
        "name": null,
        "override": [
          "yes",
          "no"
        ],
        "as": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:param",
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:if": {
      "attrs": {
        "test": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:import": {
      "attrs": {
        "href": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      }
    },
    "xsl:import-schema": {
      "attrs": {
        "namespace": null,
        "schema-location": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      }
    },
    "xsl:include": {
      "attrs": {
        "href": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      }
    },
    "xsl:key": {
      "attrs": {
        "name": null,
        "match": null,
        "use": null,
        "collation": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:matching-substring": {
      "attrs": {
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:message": {
      "attrs": {
        "select": null,
        "terminate": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:namespace": {
      "attrs": {
        "name": null,
        "select": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:namespace-alias": {
      "attrs": {
        "stylesheet-prefix": null,
        "result-prefix": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      }
    },
    "xsl:next-match": {
      "attrs": {
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:with-param",
        "xsl:fallback"
      ]
    },
    "xsl:non-matching-substring": {
      "attrs": {
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:number": {
      "attrs": {
        "value": null,
        "select": null,
        "level": [
          "single",
          "multiple",
          "any"
        ],
        "count": null,
        "from": null,
        "format": null,
        "lang": null,
        "letter-value": null,
        "ordinal": null,
        "grouping-separator": null,
        "grouping-size": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      }
    },
    "xsl:otherwise": {
      "attrs": {
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:output": {
      "attrs": {
        "name": null,
        "method": null,
        "byte-order-mark": [
          "yes",
          "no"
        ],
        "cdata-section-elements": null,
        "doctype-public": null,
        "doctype-system": null,
        "encoding": null,
        "escape-uri-attributes": [
          "yes",
          "no"
        ],
        "include-content-type": [
          "yes",
          "no"
        ],
        "indent": [
          "yes",
          "no"
        ],
        "media-type": null,
        "normalization-form": null,
        "omit-xml-declaration": [
          "yes",
          "no"
        ],
        "standalone": [
          "yes",
          "no",
          "omit"
        ],
        "undeclare-prefixes": [
          "yes",
          "no"
        ],
        "use-character-maps": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      }
    },
    "xsl:output-character": {
      "attrs": {
        "character": null,
        "string": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      }
    },
    "xsl:param": {
      "attrs": {
        "name": null,
        "select": null,
        "as": null,
        "required": [
          "yes",
          "no"
        ],
        "tunnel": [
          "yes",
          "no"
        ],
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:perform-sort": {
      "attrs": {
        "select": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:sort",
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:preserve-space": {
      "attrs": {
        "elements": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      }
    },
    "xsl:processing-instruction": {
      "attrs": {
        "name": null,
        "select": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:result-document": {
      "attrs": {
        "format": null,
        "href": null,
        "type": null,
        "validation": [
          "strict",
          "lax",
          "preserve",
          "strip"
        ],
        "method": null,
        "byte-order-mark": null,
        "cdata-section-elements": null,
        "doctype-public": null,
        "doctype-system": null,
        "encoding": null,
        "escape-uri-attributes": null,
        "include-content-type": null,
        "indent": null,
        "media-type": null,
        "normalization-form": null,
        "omit-xml-declaration": null,
        "standalone": null,
        "undeclare-prefixes": null,
        "use-character-maps": null,
        "output-version": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:sequence": {
      "attrs": {
        "select": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:fallback"
      ]
    },
    "xsl:sort": {
      "attrs": {
        "select": null,
        "lang": null,
        "data-type": null,
        "order": null,
        "case-order": null,
        "collation": null,
        "stable": [
          "yes",
          "no"
        ],
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:strip-space": {
      "attrs": {
        "elements": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      }
    },
    "xsl:stylesheet": {
      "attrs": {
        "id": null,
        "default-validation": [
          "preserve",
          "strip"
        ],
        "input-type-annotations": [
          "preserve",
          "strip",
          "unspecified"
        ],
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:import",
        "xsl:declaration",
        "xsl:variable",
        "xsl:param",
      "xsl:template"
      ]
    },
    "xsl:template": {
      "attrs": {
        "match": null,
        "priority": null,
        "mode": null,
        "name": null,
        "as": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:param",
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:text": {
      "attrs": {
        "disable-output-escaping": [
          "yes",
          "no"
        ],
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      }
    },
    "xsl:transform": {
      "attrs": {
        "id": null,
        "default-validation": [
          "preserve",
          "strip"
        ],
        "input-type-annotations": [
          "preserve",
          "strip",
          "unspecified"
        ],
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:import",
        "xsl:declaration",
        "xsl:variable",
        "xsl:param"
      ]
    },
    "xsl:value-of": {
      "attrs": {
        "select": null,
        "separator": null,
        "disable-output-escaping": [
          "yes",
          "no"
        ],
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:variable": {
      "attrs": {
        "name": null,
        "select": null,
        "as": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:when": {
      "attrs": {
        "test": null,
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:with-param": {
      "attrs": {
        "name": null,
        "select": null,
        "as": null,
        "tunnel": [
          "yes",
          "no"
        ],
        "version": null,
        "default-collation": null,
        "exclude-result-prefixes": null,
        "extension-element-prefixes": null,
        "use-when": null,
        "xpath-default-namespace": null
      },
      "children": [
        "xsl:variable",
        "xsl:instruction",
        "xsl:literal-result-element"
      ]
    },
    "xsl:literal-result-element": {}
};

function CM_XSLT_completeAfter(cm, pred) {
  var cur = cm.getCursor();
  if (!pred || pred()) setTimeout(function() {
    if (!cm.state.completionActive)
      CodeMirror.showHint(cm, CodeMirror.hint.xml, {schemaInfo: CM_XSLT_tags, completeSingle: false});
  }, 100);
  return CodeMirror.Pass;
}

function CM_XSLT_completeIfAfterLt(cm) {
  return CM_XSLT_completeAfter(cm, function() {
    var cur = cm.getCursor();
    return cm.getRange(CodeMirror.Pos(cur.line, cur.ch - 1), cur) == "<";
  });
}

function CM_XSLT_completeIfInTag(cm) {
  return CM_XSLT_completeAfter(cm, function() {
    var tok = cm.getTokenAt(cm.getCursor());
    if (tok.type == "string" && (!/['"]/.test(tok.string.charAt(tok.string.length - 1)) || tok.string.length == 1)) return false;
    var inner = CodeMirror.innerMode(cm.getMode(), tok.state).state;
    return inner.tagName;
  });
}