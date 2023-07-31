webvowl.app = function(e) {
    function t(o) {
        if (n[o]) return n[o].exports;
        var r = n[o] = {
            exports: {},
            id: o,
            loaded: !1
        };
        return e[o].call(r.exports, r, r.exports, t), r.loaded = !0, r.exports
    }
    var n = {};
    return t.m = e, t.c = n, t.p = "", t(0)
}({
    0: function(e, t, n) {
        n(314), n(316), e.exports = n(317)
    },
    6: function(e, t) {
        e.exports = d3
    },
    86: function(e, t, n) {
        function o(e) {
            return null == e ? void 0 === e ? s : l : c && c in Object(e) ? a(e) : i(e)
        }
        var r = n(87),
            a = n(90),
            i = n(91),
            l = "[object Null]",
            s = "[object Undefined]",
            c = r ? r.toStringTag : void 0;
        e.exports = o
    },
    87: function(e, t, n) {
        var o = n(88),
            r = o.Symbol;
        e.exports = r
    },
    88: function(e, t, n) {
        var o = n(89),
            r = "object" == typeof self && self && self.Object === Object && self,
            a = o || r || Function("return this")();
        e.exports = a
    },
    89: function(e, t) {
        (function(t) {
            var n = "object" == typeof t && t && t.Object === Object && t;
            e.exports = n
        }).call(t, function() {
            return this
        }())
    },
    90: function(e, t, n) {
        function o(e) {
            var t = i.call(e, s),
                n = e[s];
            try {
                e[s] = void 0;
                var o = !0
            } catch (e) {}
            var r = l.call(e);
            return o && (t ? e[s] = n : delete e[s]), r
        }
        var r = n(87),
            a = Object.prototype,
            i = a.hasOwnProperty,
            l = a.toString,
            s = r ? r.toStringTag : void 0;
        e.exports = o
    },
    91: function(e, t) {
        function n(e) {
            return r.call(e)
        }
        var o = Object.prototype,
            r = o.toString;
        e.exports = n
    },
    98: function(e, t, n) {
        function o(e) {
            return "symbol" == typeof e || a(e) && r(e) == i
        }
        var r = n(86),
            a = n(99),
            i = "[object Symbol]";
        e.exports = o
    },
    99: function(e, t) {
        function n(e) {
            return null != e && "object" == typeof e
        }
        e.exports = n
    },
    107: function(e, t) {
        var n = Array.isArray;
        e.exports = n
    },
    149: function(e, t) {
        function n(e, t) {
            for (var n = -1, o = null == e ? 0 : e.length, r = Array(o); ++n < o;) r[n] = t(e[n], n, e);
            return r
        }
        e.exports = n
    },
    214: function(e, t, n) {
        function o(e) {
            return null == e ? "" : r(e)
        }
        var r = n(215);
        e.exports = o
    },
    215: function(e, t, n) {
        function o(e) {
            if ("string" == typeof e) return e;
            if (i(e)) return a(e, o) + "";
            if (l(e)) return d ? d.call(e) : "";
            var t = e + "";
            return "0" == t && 1 / e == -s ? "-0" : t
        }
        var r = n(87),
            a = n(149),
            i = n(107),
            l = n(98),
            s = 1 / 0,
            c = r ? r.prototype : void 0,
            d = c ? c.toString : void 0;
        e.exports = o
    },
    314: function(e, t) {},
    316: function(e, t, n) {
        (function(t) {
            function n() {
                var e, t, n = -1,
                    o = /(?:\b(MS)?IE\s+|\bTrident\/7\.0;.*\s+rv:|\bEdge\/)(\d+)/.test(navigator.userAgent);
                if (o) return n = parseInt("12");
                var r = /Trident.*rv[ :]*11\./.test(navigator.userAgent);
                return r ? n = parseInt("11") : ("Microsoft Internet Explorer" === navigator.appName ? (e = navigator.userAgent, t = new RegExp("MSIE ([0-9]{1,}[\\.0-9]{0,})"), null !== t.exec(e) && (n = parseFloat(RegExp.$1))) : "Netscape" === navigator.appName && (e = navigator.userAgent, t = new RegExp("Trident/.*rv:([0-9]{1,}[\\.0-9]{0,})"), null !== t.exec(e) && (n = parseFloat(RegExp.$1))), n)
            }

            function o() {
                var e = n();
                if (console.log("Browser Version =" + e), e > 0 && e <= 11 && (t.select("#browserCheck").classed("hidden", !1), t.select("#killWarning").classed("hidden", !0), t.select("#optionsArea").classed("hidden", !0), t.select("#logo").classed("hidden", !0)), 12 == e) {
                    t.select("#logo").classed("hidden", !1), t.select("#browserCheck").classed("hidden", !1);
                    var o = t.select("#killWarning");
                    o.on("click", function() {
                        console.log("hide the warning please"), t.select("#browserCheck").classed("hidden", !0), t.select("#logo").style("padding", "10px")
                    })
                } else t.select("#logo").classed("hidden", !1), t.select("#browserCheck").classed("hidden", !0)
            }
            e.exports = o, o()
        }).call(t, n(6))
    },
    317: function(e, t, n) {
        (function(t) {
            e.exports = function() {
                function e(e, t, n) {
                    if (v.reset(), void 0 === e && void 0 === t) return void console.log("Nothing to load");
                    var o;
                    if (e) {
                        var r;
                        try {
                            o = JSON.parse(e), r = !0
                        } catch (e) {
                            r = !1
                        }
                        if (r === !1) return console.log("Retrieved data is not valid! (JSON.parse Error)"), void h.emptyGraphError();
                        if (!t) {
                            var a = o.header ? o.header.title : void 0,
                                c = s.textInLanguage(a);
                            t = c ? c : n
                        }
                    }
                    var u = parseInt(o.metrics.classCount),
                        p = parseInt(o.metrics.objectPropertyCount),
                        f = parseInt(o.metrics.datatypePropertyCount);
                    0 === u && 0 === p && 0 === f && h.emptyGraphError(), d.setJsonText(e), l.data(o), i.load(), b.updateOntologyInformation(o, L), d.setFilename(t)
                }

                function o() {
                    var e = t.select(c),
                        n = e.select("svg"),
                        o = window.innerHeight - 40,
                        r = window.innerWidth - .22 * window.innerWidth;
                    e.style("height", o + "px"), n.attr("width", r).attr("height", o), l.width(r).height(o), i.updateStyle(), m.updateVisibilityStatus();
                    var a = t.select("#browserCheck");
                    if (0 == a.classed("hidden")) {
                        var s = 10 + a.node().getBoundingClientRect().height;
                        t.select("#logo").style("padding", s + "px 10px")
                    } else t.select("#logo").style("padding", "10px")
                }

                function r() {
                    var e, t, n = -1,
                        o = /(?:\b(MS)?IE\s+|\bTrident\/7\.0;.*\s+rv:|\bEdge\/)(\d+)/.test(navigator.userAgent);
                    if (o) return n = parseInt("12");
                    var r = /Trident.*rv[ :]*11\./.test(navigator.userAgent);
                    return r ? n = parseInt("11") : ("Microsoft Internet Explorer" === navigator.appName ? (e = navigator.userAgent, t = new RegExp("MSIE ([0-9]{1,}[\\.0-9]{0,})"), null !== t.exec(e) && (n = parseFloat(RegExp.$1))) : "Netscape" === navigator.appName && (e = navigator.userAgent, t = new RegExp("Trident/.*rv:([0-9]{1,}[\\.0-9]{0,})"), null !== t.exec(e) && (n = parseFloat(RegExp.$1))), n)
                }
                var a = {},
                    i = webvowl.graph(),
                    l = i.graphOptions(),
                    s = webvowl.util.languageTools(),
                    c = "#graph",
                    d = n(318)(i),
                    u = n(319)(i),
                    p = n(320)(i),
                    f = n(321)(i),
                    h = n(322)(i),
                    v = n(326)(i),
                    g = n(327)(i),
                    y = n(328)(i),
                    m = n(329)(i),
                    b = n(330)(i),
                    x = webvowl.modules.colorExternalsSwitch(i),
                    k = webvowl.modules.compactNotationSwitch(i),
                    C = webvowl.modules.datatypeFilter(),
                    w = webvowl.modules.disjointFilter(),
                    S = webvowl.modules.focuser(),
                    O = webvowl.modules.emptyLiteralFilter(),
                    E = webvowl.modules.nodeDegreeFilter(u),
                    A = webvowl.modules.nodeScalingSwitch(i),
                    I = webvowl.modules.objectPropertyFilter(),
                    D = webvowl.modules.pickAndPin(),
                    M = webvowl.modules.selectionDetailsDisplayer(b.updateSelectionInformation),
                    L = webvowl.modules.statistics(),
                    R = webvowl.modules.subclassFilter(),
                    N = webvowl.modules.setOperatorFilter();
                return a.initialize = function() {
                    l.graphContainerSelector(c), l.selectionModules().push(S), l.selectionModules().push(M), l.selectionModules().push(D), l.filterModules().push(O), l.filterModules().push(L), l.filterModules().push(C), l.filterModules().push(I), l.filterModules().push(R), l.filterModules().push(w), l.filterModules().push(N), l.filterModules().push(A), l.filterModules().push(E), l.filterModules().push(k), l.filterModules().push(x), t.select(window).on("resize", o), d.setup(), p.setup(), u.setup(C, I, R, w, N, E), f.setup(D, A, k, x), v.setup(), b.setup();
                    var n = r();
                    if (console.log("agent Version " + n), n > 0 && n <= 11) console.log("this agent is not supported"), t.select("#browserCheck").classed("hidden", !1), t.select("#killWarning").classed("hidden", !0), t.select("#optionsArea").classed("hidden", !0), t.select("#logo").classed("hidden", !0);
                    else {
                        t.select("#logo").classed("hidden", !1), 12 == n ? (t.select("#browserCheck").classed("hidden", !1), t.select("#killWarning").classed("hidden", !1)) : t.select("#browserCheck").classed("hidden", !0), h.setup(e), g.setup([p, u, f, S, M, v]), y.setup(), m.setup(), l.literalFilter(O), l.filterMenu(u), l.modeMenu(f), l.gravityMenu(p), l.pausedMenu(v), l.pickAndPinModule(D), l.resetMenu(g), l.searchMenu(y), l.ontologyMenu(h), l.navigationMenu(m), l.sidebar(b), i.start(), o();
                        var a, s = i.options().width(),
                            j = i.options().height();
                        a = Math.min(s, j) / 1e3, i.setDefaultZoom(a)
                    }
                }, a
            }
        }).call(t, n(6))
    },
    318: function(e, t, n) {
        (function(t) {
            e.exports = function(e) {
                function n() {
                    var n, a, i, l = t.select(e.options().graphContainerSelector()).select("svg");
                    r(), s(), n = l.attr("version", 1.1).attr("xmlns", "http://www.w3.org/2000/svg").node().parentNode.innerHTML, n = "<!-- Created with WebVOWL (version " + webvowl.version + "), http://vowl.visualdataweb.org -->\n" + n, a = o(n), i = "data:image/svg+xml;base64," + btoa(a), p.attr("href", i).attr("download", f + ".svg"), c(), d()
                }

                function o(e) {
                    var t, n, o, r = [],
                        a = e.length;
                    for (t = 0; t < a; t++) n = e.charAt(t), o = n.charCodeAt(0), o < 128 ? r.push(n) : r.push("&#" + o + ";");
                    return r.join("")
                }

                function r() {
                    a(".text", [{
                        name: "font-family",
                        value: "Helvetica, Arial, sans-serif"
                    }, {
                        name: "font-size",
                        value: "12px"
                    }]), a(".subtext", [{
                        name: "font-size",
                        value: "9px"
                    }]), a(".text.instance-count", [{
                        name: "fill",
                        value: "#666"
                    }]), a(".external + text .instance-count", [{
                        name: "fill",
                        value: "#aaa"
                    }]), a(".cardinality", [{
                        name: "font-size",
                        value: "10px"
                    }]), a(".text, .embedded", [{
                        name: "pointer-events",
                        value: "none"
                    }]), a(".class, .object, .disjoint, .objectproperty, .disjointwith, .equivalentproperty, .transitiveproperty, .functionalproperty, .inversefunctionalproperty, .symmetricproperty, .allvaluesfromproperty, .somevaluesfromproperty", [{
                        name: "fill",
                        value: "#acf"
                    }]), a(".label .datatype, .datatypeproperty", [{
                        name: "fill",
                        value: "#9c6"
                    }]), a(".rdf, .rdfproperty", [{
                        name: "fill",
                        value: "#c9c"
                    }]), a(".literal, .node .datatype", [{
                        name: "fill",
                        value: "#fc3"
                    }]), a(".deprecated, .deprecatedproperty", [{
                        name: "fill",
                        value: "#ccc"
                    }]), a(".external, .externalproperty", [{
                        name: "fill",
                        value: "#36c"
                    }]), a("path, .nofill", [{
                        name: "fill",
                        value: "none"
                    }]), a("marker path", [{
                        name: "fill",
                        value: "#000"
                    }]), a(".class, path, line, .fineline", [{
                        name: "stroke",
                        value: "#000"
                    }]), a(".white, .subclass, .subclassproperty, .external + text", [{
                        name: "fill",
                        value: "#fff"
                    }]), a(".class.hovered, .property.hovered, .cardinality.hovered, .cardinality.focused, circle.pin, .filled.hovered, .filled.focused", [{
                        name: "fill",
                        value: "#f00"
                    }, {
                        name: "cursor",
                        value: "pointer"
                    }]), a(".focused, path.hovered", [{
                        name: "stroke",
                        value: "#f00"
                    }]), a(".indirect-highlighting, .feature:hover", [{
                        name: "fill",
                        value: "#f90"
                    }]), a(".values-from", [{
                        name: "stroke",
                        value: "#69c"
                    }]), a(".symbol, .values-from.filled", [{
                        name: "fill",
                        value: "#69c"
                    }]), a(".class, path, line", [{
                        name: "stroke-width",
                        value: "2"
                    }]), a(".fineline", [{
                        name: "stroke-width",
                        value: "1"
                    }]), a(".dashed, .anonymous", [{
                        name: "stroke-dasharray",
                        value: "8"
                    }]), a(".dotted", [{
                        name: "stroke-dasharray",
                        value: "3"
                    }]), a("rect.focused, circle.focused", [{
                        name: "stroke-width",
                        value: "4px"
                    }]), a(".nostroke", [{
                        name: "stroke",
                        value: "none"
                    }]), a("marker path", [{
                        name: "stroke-dasharray",
                        value: "100"
                    }])
                }

                function a(e, n) {
                    var o = t.selectAll(e);
                    o.empty() || n.forEach(function(e) {
                        o.each(function() {
                            var n = t.select(this);
                            i(n, e.name) || n.style(e.name, e.value)
                        })
                    })
                }

                function i(e, t) {
                    return "fill" === t && l(e)
                }

                function l(e) {
                    var t = e.datum();
                    return t.backgroundColor && !!t.backgroundColor()
                }

                function s() {
                    t.selectAll(".hidden-in-export").style("display", "none")
                }

                function c() {
                    t.selectAll(".text, .subtext, .text.instance-count, .external + text .instance-count, .cardinality, .text, .embedded, .class, .object, .disjoint, .objectproperty, .disjointwith, .equivalentproperty, .transitiveproperty, .functionalproperty, .inversefunctionalproperty, .symmetricproperty, .allvaluesfromproperty, .somevaluesfromproperty, .label .datatype, .datatypeproperty, .rdf, .rdfproperty, .literal, .node .datatype, .deprecated, .deprecatedproperty, .external, .externalproperty, path, .nofill, .symbol, .values-from.filled, marker path, .class, path, line, .fineline, .white, .subclass, .subclassproperty, .external + text, .class.hovered, .property.hovered, .cardinality.hovered, .cardinality.focused, circle.pin, .filled.hovered, .filled.focused, .focused, path.hovered, .indirect-highlighting, .feature:hover, .values-from, .class, path, line, .fineline, .dashed, .anonymous, .dotted, rect.focused, circle.focused, .nostroke, marker path").each(function() {
                        var e = t.select(this),
                            n = e.node().style;
                        for (var o in n)
                            if (n.hasOwnProperty(o)) {
                                if (i(e, o)) continue;
                                e.style(o, null)
                            }
                        e.datum && e.datum().type && "rdfs:subClassOf" === e.datum().type() && e.style("fill", null)
                    })
                }

                function d() {
                    t.selectAll(".hidden-in-export").style("display", null)
                }

                function u() {
                    if (!v) return alert("No graph data available."), void t.event.preventDefault();
                    var n, o = e.graphNodeElements(),
                        r = e.graphLabelElements(),
                        a = JSON.parse(v),
                        i = a._comment,
                        l = " [Additional Information added by WebVOWL Exporter Version: 1.0.4]";
                    i.indexOf(l) === -1 && (a._comment = i + " [Additional Information added by WebVOWL Exporter Version: 1.0.4]");
                    var s = a.classAttribute,
                        c = a.propertyAttribute;
                    for (n = 0; n < s.length; n++) {
                        var d = s[n];
                        delete d.pos, delete d.pinned
                    }
                    var u;
                    for (n = 0; n < c.length; n++) u = c[n], delete u.pos, delete u.pinned;
                    o.each(function(e) {
                        var t = e.id();
                        for (n = 0; n < s.length; n++) {
                            var o = s[n];
                            if (o.id === t) {
                                o.pos = [e.x, e.y], e.pinned() && (o.pinned = !0);
                                break
                            }
                        }
                    });
                    for (var p = 0; p < r.length; p++) {
                        var g = r[p].property();
                        for (n = 0; n < c.length; n++)
                            if (u = c[n], u.id === g.id()) {
                                u.pos = [r[p].x, r[p].y], r[p].pinned() && (u.pinned = !0);
                                break
                            }
                    }
                    a.settings = {};
                    var y = e.scaleFactor(),
                        m = e.paused(),
                        b = e.translation();
                    a.settings.global = {}, a.settings.global.zoom = y, a.settings.global.translation = b, a.settings.global.paused = m;
                    var x, k, C, w = e.options().classDistance(),
                        S = e.options().datatypeDistance();
                    a.settings.gravity = {}, a.settings.gravity.classDistance = w, a.settings.gravity.datatypeDistance = S;
                    var O = e.options().filterMenu(),
                        E = O.getCheckBoxContainer(),
                        A = [];
                    for (n = 0; n < E.length; n++) x = E[n].checkbox.attr("id"), k = E[n].checkbox.property("checked"), C = {}, C.id = x, C.checked = k, A.push(C);
                    var I = O.getDegreeSliderValue();
                    a.settings.filter = {}, a.settings.filter.checkBox = A, a.settings.filter.degreeSliderValue = I;
                    var D = e.options().modeMenu(),
                        M = D.getCheckBoxContainer(),
                        L = [];
                    for (n = 0; n < M.length; n++) x = M[n].attr("id"), k = M[n].property("checked"), C = {}, C.id = x, C.checked = k, L.push(C);
                    var R = D.colorModeState();
                    a.settings.modes = {}, a.settings.modes.checkBox = L, a.settings.modes.colorSwitchState = R;
                    var N = {};
                    N._comment = a._comment, N.header = a.header, N.namespace = a.namespace, N.metrics = a.metrics, N.settings = a.settings, N.class = a.class, N.classAttribute = a.classAttribute, N.property = a.property, N.propertyAttribute = a.propertyAttribute;
                    var j = JSON.stringify(N, null, "  "),
                        F = "data:text/json;charset=utf-8," + encodeURIComponent(j);
                    h.attr("href", F).attr("download", f + ".json")
                }
                var p, f, h, v, g = {};
                return g.setup = function() {
                    p = t.select("#exportSvg").on("click", n), h = t.select("#exportJson").on("click", u);
                    var o = t.select("#export");
                    o.on("mouseover", function() {
                        var t = e.options().searchMenu();
                        t.hideSearchEntries()
                    })
                }, g.setFilename = function(e) {
                    f = e || "export"
                }, g.setJsonText = function(e) {
                    v = e
                }, g
            }
        }).call(t, n(6))
    },
    319: function(e, t, n) {
        (function(t) {
            e.exports = function(e) {
                function n(n, o, r, a) {
                    var i, l;
                    i = t.select(a).append("div").classed("checkboxContainer", !0), l = i.append("input").classed("filterCheckbox", !0).attr("id", o + "FilterCheckbox").attr("type", "checkbox").property("checked", n.enabled()), c.push({
                        checkbox: l,
                        defaultState: n.enabled()
                    }), l.on("click", function(t) {
                        var o = l.property("checked");
                        n.enabled(o), t !== !0 && e.update()
                    }), i.append("label").attr("for", o + "FilterCheckbox").text(r)
                }

                function o(t, n) {
                    t.setMaxDegreeSetter(function(e) {
                        l.attr("max", e), a(l, Math.min(e, l.property("value")))
                    }), t.setDegreeGetter(function() {
                        return +l.property("value")
                    }), t.setDegreeSetter(function(e) {
                        a(l, e)
                    });
                    var o, s;
                    o = n.append("div").classed("distanceSliderContainer", !0), l = o.append("input").attr("id", "nodeDegreeDistanceSlider").attr("type", "range").attr("min", 0).attr("step", 1), o.append("label").classed("description", !0).attr("for", "nodeDegreeDistanceSlider").text("Degree of collapsing"), s = o.append("label").classed("value", !0).attr("for", "nodeDegreeDistanceSlider").text(0), l.on("change", function(t) {
                        t !== !0 && (e.update(), i = l.property("value"))
                    }), l.on("input", function() {
                        var e = l.property("value");
                        s.text(e)
                    }), l.on("wheel", r), l.on("focusout", function() {
                        l.property("value") !== i && e.update()
                    })
                }

                function r() {
                    var n, o = t.event;
                    o.deltaY < 0 && (n = 1), o.deltaY > 0 && (n = -1);
                    var r = parseInt(l.property("value")),
                        a = r + n;
                    r !== a && (l.property("value", a), l.on("input")(), e.update())
                }

                function a(e, t) {
                    e.property("value", t).on("input")()
                }
                var i, l, s = {},
                    c = [],
                    d = t.select("#filterOption a"),
                    u = t.select("#nodeDegreeFilteringOption");
                return s.getCheckBoxContainer = function() {
                    return c
                }, s.getDegreeSliderValue = function() {
                    return l.property("value")
                }, s.setup = function(r, a, i, l, c, p) {
                    var f = t.select("#filterOption");
                    f.on("mouseover", function() {
                        var t = e.options().searchMenu();
                        t.hideSearchEntries()
                    }), d.on("mouseleave", function() {
                        s.highlightForDegreeSlider(!1)
                    }), n(r, "datatype", "Datatype properties", "#datatypeFilteringOption"), n(a, "objectProperty", "Object properties", "#objectPropertyFilteringOption"), n(i, "subclass", "Solitary subclasses", "#subclassFilteringOption"), n(l, "disjoint", "Class disjointness", "#disjointFilteringOption"), n(c, "setoperator", "Set operators", "#setOperatorFilteringOption"), o(p, u)
                }, s.reset = function() {
                    c.forEach(function(e) {
                        var t = e.checkbox,
                            n = e.defaultState,
                            o = t.property("checked");
                        o !== n && (t.property("checked", n), t.on("click")())
                    }), a(l, 0), l.on("change")()
                }, s.highlightForDegreeSlider = function(e) {
                    if (arguments.length || (e = !0), d.classed("highlighted", e), u.classed("highlighted", e), d.classed("buttonPulse") === !0 && e === !0) {
                        d.classed("buttonPulse", !1);
                        var t = setTimeout(function() {
                            d.classed("buttonPulse", e), clearTimeout(t)
                        }, 100)
                    } else d.classed("buttonPulse", e)
                }, s.setCheckBoxValue = function(e, t) {
                    for (var n = 0; n < c.length; n++) {
                        var o = c[n].checkbox.attr("id");
                        if (o === e) {
                            c[n].checkbox.property("checked", t);
                            break
                        }
                    }
                }, s.setDegreeSliderValue = function(e) {
                    l.property("value", e)
                }, s.updateSettings = function() {
                    var e = !0,
                        t = l.property("value");
                    t > 0 ? s.highlightForDegreeSlider(!0) : s.highlightForDegreeSlider(!1), c.forEach(function(t) {
                        var n = t.checkbox;
                        n.on("click")(e)
                    }), l.on("input")(), l.on("change")(e)
                }, s
            }
        }).call(t, n(6))
    },
    320: function(e, t, n) {
        (function(t) {
            e.exports = function(e) {
                function n(n, r, i, l) {
                    var s, c, d = l();
                    s = t.select(n).append("div").datum({
                        distanceFunction: l
                    }).classed("distanceSliderContainer", !0);
                    var u = s.append("input").attr("id", r + "DistanceSlider").attr("type", "range").attr("min", 10).attr("max", 600).attr("value", l()).attr("step", 10);
                    s.append("label").classed("description", !0).attr("for", r + "DistanceSlider").text(i), c = s.append("label").classed("value", !0).attr("for", r + "DistanceSlider").text(l()), a.push(u), u.on("focusout", function() {
                        e.updateStyle()
                    }), u.on("input", function() {
                        var t = u.property("value");
                        l(t), o(d), c.text(t), e.updateStyle()
                    }), u.on("wheel", function() {
                        var e, n = t.event;
                        n.deltaY < 0 && (e = 10), n.deltaY > 0 && (e = -10);
                        var o = parseInt(u.property("value")),
                            r = o + e;
                        r !== o && (u.property("value", r), l(r), u.on("input")())
                    })
                }

                function o(e) {
                    var t = Math.max(i.classDistance(), i.datatypeDistance()),
                        n = t / e,
                        o = l * n;
                    i.charge(o)
                }
                var r = {},
                    a = [],
                    i = e.graphOptions(),
                    l = i.charge();
                return r.setup = function() {
                    var o = t.select("#gravityOption");
                    o.on("mouseover", function() {
                        var t = e.options().searchMenu();
                        t.hideSearchEntries()
                    }), n("#classSliderOption", "class", "Class distance", i.classDistance), n("#datatypeSliderOption", "datatype", "Datatype distance", i.datatypeDistance)
                }, r.reset = function() {
                    a.forEach(function(e) {
                        e.property("value", function(e) {
                            return e.distanceFunction()
                        }), e.on("input")()
                    })
                }, r
            }
        }).call(t, n(6))
    },
    321: function(e, t, n) {
        (function(t) {
            e.exports = function(e) {
                function n(n, o, r, a, i) {
                    var l = t.select(r).append("div").classed("checkboxContainer", !0),
                        s = l.append("input").classed("moduleCheckbox", !0).attr("id", n + "ModuleCheckbox").attr("type", "checkbox").property("checked", a());
                    s.on("click", function(t) {
                        var n = s.property("checked");
                        a(n), i > 0 && e.update()
                    }), l.append("label").attr("for", n + "ModuleCheckbox").text(o)
                }

                function o(n, o, r, a, i) {
                    var l, s;
                    return l = t.select(a).append("div").classed("checkboxContainer", !0).datum({
                        module: n,
                        defaultState: n.enabled()
                    }), s = l.append("input").classed("moduleCheckbox", !0).attr("id", o + "ModuleCheckbox").attr("type", "checkbox").property("checked", n.enabled()), u.push(s), s.on("click", function(t, n) {
                        var o = s.property("checked");
                        t.module.enabled(o), i && n !== !0 && e.update()
                    }), l.append("label").attr("for", o + "ModuleCheckbox").text(r), l
                }

                function r(t, n) {
                    var o = t.append("button").datum({
                        active: !1
                    }).classed("color-mode-switch", !0);
                    return a(o, n), o.on("click", function(t) {
                        var r = o.datum();
                        r.active = !r.active, a(o, n), n.enabled() && t !== !0 && e.update()
                    }), o
                }

                function a(e, t) {
                    var n = e.datum().active,
                        o = i(n);
                    e.classed("active", n).text(o.text), t && t.colorModeType(o.type)
                }

                function i(e) {
                    return e ? c : s
                }
                var l, s = {
                        text: "Multicolor",
                        type: "same"
                    },
                    c = {
                        text: "Multicolor",
                        type: "gradient"
                    },
                    d = {},
                    u = [];
                return d.colorModeState = function(e) {
                    return arguments.length ? (l.datum().active = e, d) : l.datum().active
                }, d.getCheckBoxContainer = function() {
                    return u
                }, d.colorModeSwitch = function() {
                    return l
                }, d.setup = function(a, i, s, c) {
                    var d = t.select("#moduleOption");
                    d.on("mouseover", function() {
                        var t = e.options().searchMenu();
                        t.hideSearchEntries()
                    }), n("labelWidth", "Dynamic label width", "#dynamicLabelWidth", e.options().dynamicLabelWidth, 1), o(a, "pickandpin", "Pick & pin", "#pickAndPinOption", !1), o(i, "nodescaling", "Node scaling", "#nodeScalingOption", !0), o(s, "compactnotation", "Compact notation", "#compactNotationOption", !0);
                    var u = o(c, "colorexternals", "Color externals", "#colorExternalsOption", !0);
                    l = r(u, c)
                }, d.reset = function() {
                    u.forEach(function(e) {
                        var t = e.datum().defaultState,
                            n = e.property("checked");
                        n !== t && (e.property("checked", t), e.on("click")(e.datum())), e.datum().module.reset()
                    }), l.datum().active = !0, l.on("click")()
                }, d.setCheckBoxValue = function(e, t) {
                    for (var n = 0; n < u.length; n++) {
                        var o = u[n].attr("id");
                        if (o === e) {
                            u[n].property("checked", t);
                            break
                        }
                    }
                }, d.setColorSwitchState = function(e) {
                    d.colorModeState(!e)
                }, d.updateSettings = function() {
                    var e = !0;
                    u.forEach(function(t) {
                        t.on("click")(t.datum(), e)
                    }), l.on("click")(e)
                }, d
            }
        }).call(t, n(6))
    },
    322: function(e, t, n) {
        (function(t) {
            var o = n(323);
            e.exports = function(e) {
                function n() {
                    a(), t.select(window).on("hashchange", function() {
                        var e = t.event.oldURL,
                            n = t.event.newURL;
                        if (e !== n) {
                            if (n === e + "#") return;
                            r(), a()
                        }
                    }), r()
                }

                function r() {
                    t.selectAll("#optionsMenu > li > a").attr("href", location.hash || "#")
                }

                function a() {
                   C = '1';
                    var e = location.hash.slice(1);
                    e || (e = C);
                    var n = t.selectAll(".select li").classed("selected-ontology", !1),
                    href  = $('.toolTipMenu.select li a[href="#'+e+'"]').attr('rel');
                    
                    O = !1;
                    var o = "iri=",
                        r = "url=",
                        a = "file=";
                    if (e.substr(0, a.length) === a) {
                        var s = decodeURIComponent(e.slice(a.length));
                        d(s)
                    } else if (e.substr(0, r.length) === r) {
                        var c = decodeURIComponent(e.slice(r.length));
                        i("read?json=" + encodeURIComponent(c), c);
                    } else if (e.substr(0, o.length) === o) {
                        var u = decodeURIComponent(e.slice(o.length));
                        l("convert?iri=" + encodeURIComponent(u), u), t.select("#converter-option").classed("selected-ontology", !0)
                    } else l(href, e), n.each(function() {
                        var n = t.select(this);
                        //console.log(n);
                        //result change EDSON
                        n.select("a").size() > 0 && n.select("a").attr("href") === "#" + e && n.classed("selected-ontology", !0)
                    })
                }

                function i(n, o) {
                    b = o;
                    var r = E[n],
                        a = o.replace(/\/$/g, ""),
                        i = a.slice(a.lastIndexOf("/") + 1),
                        l = o.toLowerCase().endsWith(".json");
                    return l ? void(r ? (x(r, void 0, i), g(!0)) : (v(), t.xhr(n, "application/json", function(t, o) {
                        var r, a = !t;
                        if (null !== t && 500 === t.status || o && 0 === o.responseText.length) return y(), k.notValidJsonURL(), void(E[n] = void 0);
                        var l;
                        a ? (l = o.responseText, E[n] = l) : 404 === t.status && (r = "Connection to the OWL2VOWL interface could not be established.", e.clearGraphData()), x(l, void 0, i), g(a, t ? t.response : void 0, r), O === !0 && (k.notValidJsonFile(), e.clearGraphData()), y()
                    }))) : (k.notValidJsonURL(), void e.clearGraphData())
                }

                function l(n, o) {
                    b = o;
                    var r = E[n],
                        a = o.replace(/\/$/g, ""),
                        i = a.slice(a.lastIndexOf("/") + 1);
                    r ? (x(r, void 0, i), g(!0)) : (v(), t.xhr(n, "application/json", function(t, o) {
                        var r, a = !t;
                        if (null !== t && 500 === t.status) return y(), void k.emptyGraphError();
                        var l;
                        if (a) l = o.responseText, E[n] = l;
                        else if (404 === t.status) {
                            var s = "iri=",
                                c = "url=",
                                d = "file=",
                                u = location.hash.slice(1);
                            u.substr(0, d.length) !== d && u.substr(0, c.length) !== c && u.substr(0, s.length) !== s && k.emptyGraphError(), r = "Connection to the OWL2VOWL interface could not be established.", e.clearGraphData()
                        }
                        x(l, void 0, i), g(a, t ? t.response : void 0, r), O === !0 && (k.emptyGraphError(), e.clearGraphData()), y()
                    }))
                }

                function s() {
                    var e = t.select("#iri-converter-button"),
                        n = t.select("#iri-converter-input");
                    n.on("input", function() {
                        h();
                        var t = "" === n.property("value");
                        e.attr("disabled", t || void 0)
                    }).on("click", function() {
                        h()
                    }), t.select("#iri-converter-form").on("submit", function() {
                        for (var e = n.property("value"), o = e.replace(/%20/g, " "); o.beginsWith(" ");) o = o.substr(1, o.length);
                        for (; o.endsWith(" ");) o = o.substr(0, o.length - 1);
                        e = o;
                        var r = e.toLowerCase();
                        return r.endsWith(".json") ? (console.log("file is an URL for a json "), location.hash = "url=" + e, n.property("value", ""), n.on("input")()) : (location.hash = "iri=" + e, n.property("value", ""), n.on("input")()), t.event.preventDefault(), !1
                    })
                }

                function c() {
                    var e = t.select("#file-converter-input"),
                        n = t.select("#file-converter-label"),
                        o = t.select("#file-converter-button");
                    e.on("change", function() {
                        var t = e.property("files");
                        t.length <= 0 ? (n.text("Select ontology file"), o.property("disabled", !0)) : (n.text(t[0].name), o.property("disabled", !1), h())
                    }), o.on("click", function() {
                        var t = e.property("files")[0];
                        if (!t) return !1;
                        var n = "file=" + t.name;
                        location.hash === "#" + n ? d() : location.hash = n
                    })
                }

                function d(n) {
                    var o = E[n];
                    if (o) return v(), x(o, n), g(!0), O === !0 && k.emptyGraphError(), void y();
                    var r = t.select("#file-converter-input").property("files")[0];
                    return !r || n && n !== r.name ? (x(void 0, void 0), g(!1, void 0, 'No cached version of "' + n + '" was found. Please reupload the file.'), void e.clearGraphData()) : (n = r.name, void(n.match(/\.json$/) ? (v(), u(r, n)) : p(r, n, !0)))
                }

                function u(e, t) {
                    var n = new FileReader;
                    n.readAsText(e), n.onload = function() {
                        v(), f(n.result, t), g(!0), O === !0 && k.emptyGraphError(), y()
                    }
                }

                function p(n, o, r) {
                    var a = t.select("#file-converter-button");
                    v(), a.property("disabled", !0);
                    var i = new FormData;
                    i.append("ontology", n);
                    var l = new XMLHttpRequest;
                    l.open("POST", "convert", !0), l.onload = function() {
                        a.property("disabled", !1), 200 === l.status ? (f(l.responseText, o), E[o] = l.responseText) : (x(void 0, void 0), g(!1, l.responseText), y(), e.clearGraphData()), y(), O === !0 && r === !0 && (console.log("Failed to convert the file"), E[o] = void 0, k.notValidJsonFile())
                    }, l.send(i)
                }

                function f(e, t) {
                    var n = t.split(".")[0];
                    x(e, n)
                }

                function h() {
                    function e() {
                        n.style("display", void 0), clearTimeout(m), t.select(window).on("click", void 0).on("keydown", void 0), n.on("mouseover", void 0)
                    }
                    var n = t.select("#select .toolTipMenu");
                    n.on("click", function() {
                        t.event.stopPropagation()
                    }).on("keydown", function() {
                        t.event.stopPropagation()
                    }), n.style("display", "block"), clearTimeout(m), m = setTimeout(function() {
                        e()
                    }, 3e3), t.select(window).on("click", function() {
                        e()
                    }).on("keydown", function() {
                        e()
                    }), n.on("mouseover", function() {
                        e()
                    })
                }

                function v() {
                    w.classed("hidden", !0), S.classed("hidden", !1)
                }

                function g(e, n, r) {
                    w.classed("hidden", e);
                    var a = t.select("#error-info");
                    r ? a.text(r) : a.html('Ontology could not be loaded.<br>Is it a valid OWL ontology? Please check with <a target="_blank"href="http://visualdataweb.de/validator/">OWL Validator</a>.');
                    var i = !n,
                        l = t.select("#error-description-button").classed("hidden", i).datum().open;
                    t.select("#error-description-container").classed("hidden", i || !l), t.select("#error-description").text(o(n))
                }

                function y() {
                    S.classed("hidden", !0)
                }
                var m, b, x, k = {},
                    C = "foaf",
                    w = t.select("#loading-error"),
                    S = t.select("#loading-progress"),
                    O = !1,
                    E = {};
                return String.prototype.beginsWith = function(e) {
                    return 0 === this.indexOf(e)
                }, k.setup = function(o) {
                    x = o;
                    var r = t.select("#select");
                    r.on("mouseover", function() {
                        var t = e.options().searchMenu();
                        t.hideSearchEntries()
                    }), s(), c();
                    var a = t.select("#error-description-button").datum({
                        open: !1
                    });
                    a.on("click", function(e) {
                        var n = t.select("#error-description-container"),
                            o = t.select(this);
                        e.open = !e.open;
                        var r = e.open;
                        r ? o.text("Hide error details") : o.text("Show error details"), n.classed("hidden", !r)
                    }), n()
                }, k.setIriText = function(e) {
                    var n = t.select("#iri-converter-input");
                    n.node().value = e;
                    var o = t.select("#iri-converter-button");
                    o.attr("disabled", !1), t.select("#iri-converter-form").on("submit")()
                }, k.emptyGraphError = function() {
                    O = !0, w.classed("hidden", !1);
                    var n = t.select("#error-info");
                    n.text("There is nothing to visualize.");
                    var o = "There is no OWL input under the given IRI(" + b + "). Please try to load the OWL file directly.",
                        r = !o,
                        a = t.select("#error-description-button").classed("hidden", r).datum().open;
                    t.select("#error-description-container").classed("hidden", r || !a), t.select("#error-description").text(o), e.clearGraphData()
                }, k.notValidJsonURL = function() {
                    O = !0, w.classed("hidden", !1);
                    var n = t.select("#error-info");
                    n.text("Invalid JSON URL");
                    var o = "There is no JSON input under the given URL(" + b + "). Please try to load the JSON file directly.",
                        r = !o,
                        a = t.select("#error-description-button").classed("hidden", r).datum().open;
                    t.select("#error-description-container").classed("hidden", r || !a), t.select("#error-description").text(o), e.clearGraphData()
                }, k.notValidJsonFile = function() {
                    O = !0, w.classed("hidden", !1);
                    var n = t.select("#error-info");
                    n.text("Invalid JSON file");
                    var o = "The uploaded file is not a valid JSON file. (" + b + ")",
                        r = !o,
                        a = t.select("#error-description-button").classed("hidden", r).datum().open;
                    t.select("#error-description-container").classed("hidden", r || !a), t.select("#error-description").text(o), e.clearGraphData()
                }, k
            }
        }).call(t, n(6))
    },
    323: function(e, t, n) {
        function o(e) {
            return e = r(e), e && l.test(e) ? e.replace(i, a) : e
        }
        var r = n(214),
            a = n(324),
            i = /&(?:amp|lt|gt|quot|#39);/g,
            l = RegExp(i.source);
        e.exports = o
    },
    324: function(e, t, n) {
        var o = n(325),
            r = {
                "&amp;": "&",
                "&lt;": "<",
                "&gt;": ">",
                "&quot;": '"',
                "&#39;": "'"
            },
            a = o(r);
        e.exports = a
    },
    325: function(e, t) {
        function n(e) {
            return function(t) {
                return null == e ? void 0 : e[t]
            }
        }
        e.exports = n
    },
    326: function(e, t, n) {
        (function(t) {
            e.exports = function(e) {
                function n() {
                    o(), r()
                }

                function o() {
                    a.classed("paused", function(e) {
                        return e.paused
                    })
                }

                function r() {
                    a.datum().paused ? a.text("Resume") : a.text("Pause")
                }
                var a, i = {};
                return i.setup = function() {
                    var o = t.select("#pauseOption");
                    o.on("mouseover", function() {
                        var t = e.options().searchMenu();
                        t.hideSearchEntries()
                    }), a = t.select("#pause-button").datum({
                        paused: !1
                    }).on("click", function(t) {
                        e.paused(!t.paused), t.paused = !t.paused, n(), a.classed("highlighted", t.paused), e.options().navigationMenu().updateVisibilityStatus()
                    }), n()
                }, i.setPauseValue = function(t) {
                    a.datum().paused = t, e.paused(t), a.classed("highlighted", t), n()
                }, i.reset = function() {
                    i.setPauseValue(!1)
                }, i
            }
        }).call(t, n(6))
    },
    327: function(e, t, n) {
        (function(t) {
            e.exports = function(e) {
                function n() {
                    e.resetSearchHighlight(), e.options().searchMenu().clearText(), a.classDistance(i.classDistance()), a.datatypeDistance(i.datatypeDistance()), a.charge(i.charge()), a.gravity(i.gravity()), a.linkStrength(i.linkStrength()), e.reset(), o.forEach(function(e) {
                        e.reset()
                    }), e.updateStyle()
                }
                var o, r = {},
                    a = e.graphOptions(),
                    i = webvowl.options();
                return r.setup = function(r) {
                    o = r, t.select("#reset-button").on("click", n);
                    var a = t.select("#resetOption");
                    a.on("mouseover", function() {
                        var t = e.options().searchMenu();
                        t.hideSearchEntries()
                    })
                }, r
            }
        }).call(t, n(6))
    },
    328: function(e, t, n) {
        (function(t) {
            e.exports = function(e) {
                function n() {
                    h = e.getUpdateDictionary(), x = !1, y = [], m = [];
                    var t, n = [],
                        o = [];
                    for (t = 0; t < h.length; t++) {
                        var r = h[t].labelForCurrentLanguage();
                        if (n.push(h[t].id()), o.push(r), h[t].equivalents && h[t].equivalents().length > 0)
                            for (var a = h[t].equivalentsString(), i = a.split(", "), l = 0; l < i.length; l++) n.push(h[t].id()), o.push(i[l])
                    }
                    p = [], f = [];
                    var s, c, d = -1;
                    for (t = 0; t < o.length; t++)
                        if (0 !== t)
                            if (s = o[t], c = n[t], d = p.indexOf(s), d === -1) {
                                p.push(o[t]), f.push([]);
                                var u = f.length;
                                f[u - 1].push(c)
                            } else f[d].push(c);
                    else p.push(o[t]), f.push([]), f[0].push(n[t]);
                    for (t = 0; t < p.length; t++) {
                        for (var v = p[t], g = f[t], b = "[ ", k = 0; k < g.length; k++) b += g[k].toString(), b += ", ";
                        b = b.substring(0, b.length - 2), b += " ]";
                        var C = g[0];
                        if (g.length > 1) {
                            for (var w = !0, S = 0; S < g.length; S++) g[S] != C && (w = !1);
                            w === !0 ? y.push(v) : y.push(v + " (" + g.length + ")")
                        } else y.push(v);
                        m.push(v)
                    }
                }

                function o() {
                    g.showSearchEntries()
                }

                function r() {
                    k ? g.hideSearchEntries() : g.showSearchEntries()
                }

                function a(e) {
                    var t = /^(https?|ftp):\/\/([a-zA-Z0-9.-]+(:[a-zA-Z0-9.&%$-]+)*@)*((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])){3}|([a-zA-Z0-9-]+\.)*[a-zA-Z0-9-]+\.(com|edu|gov|int|mil|net|org|biz|arpa|info|name|pro|aero|coop|museum|[a-zA-Z]{2}))(:[0-9]+)*(\/($|[a-zA-Z0-9.,?'\\+&%$#=~_-]+))*$/;
                    return t.test(e)
                }

                function i() {
                    x && n();
                    var o, r = u.node().children,
                        i = r.length,
                        l = 0,
                        s = -1;
                    for (o = 0; o < i; o++) {
                        var c = r[o].getAttribute("class");
                        "dbEntrySelected" === c && (s = o)
                    }
                    if (13 === t.event.keyCode)
                        if (s >= 0 && s < i) r[s].onclick(), g.hideSearchEntries();
                        else if (0 === i) {
                        v = d.node().value;
                        for (var p = v.replace(/%20/g, " "); p.beginsWith(" ");) p = p.substr(1, p.length);
                        for (; p.endsWith(" ");) p = p.substr(0, p.length - 1);
                        var f = p.replace(/ /g, "%20"),
                            h = a(f);
                        if (h) {
                            var y = e.options().ontologyMenu();
                            y.setIriText(f), d.node().value = ""
                        } else console.log(f + " is not a valid URL!")
                    }
                    38 === t.event.keyCode && (l = -1, g.showSearchEntries()), 40 === t.event.keyCode && (l = 1, g.showSearchEntries());
                    var m = s + l;
                    m !== s && (m < 0 && s <= 0 && r[0].setAttribute("class", "dbEntrySelected"), m >= i && r[s].setAttribute("class", "dbEntrySelected"), m >= 0 && m < i && (r[m].setAttribute("class", "dbEntrySelected"), s >= 0 && r[s].setAttribute("class", "dbEntry")))
                }

                function l() {
                    var e, t;
                    v = d.node().value;
                    var n, o, r = [],
                        a = [],
                        i = v.toLowerCase();
                    for (n = 0; n < y.length; n++) {
                        var l = y[n];
                        void 0 !== l && (o = y[n].toLowerCase(), o.indexOf(i) > -1 && (r.push(y[n]), a.push(n)))
                    }
                    for (e = u.node().children, t = e.length, n = 0; n < t; n++) e[0].remove();
                    var s = r;
                    t = r.length, t > b && (t = b);
                    var p = [],
                        f = [];
                    for (n = 0; n < t; n++) {
                        for (var h = 1e6, g = 1e6, m = -1, x = 0; x < s.length; x++) {
                            o = s[x].toLowerCase();
                            var k = o.indexOf(i),
                                C = o.length;
                            k > -1 && k <= h && C <= g && (m = x, h = k, g = C)
                        }
                        p.push(s[m]), f.push(a[m]), s[m] = ""
                    }
                    for (t = r.length, t > b && (t = b), n = 0; n < t; n++) {
                        var w = document.createElement("li");
                        w.setAttribute("elementID", f[n]), w.onclick = c(f[n]), w.setAttribute("class", "dbEntry");
                        var S = document.createTextNode(p[n]);
                        w.appendChild(S), u.node().appendChild(w)
                    }
                }

                function s() {
                    if (x && n(), e.resetSearchHighlight(), 0 === y.length) return void console.log("dictionary is empty");
                    var o, r = u.node().children,
                        a = r.length;
                    if (v = d.node().value, t.select("#locateSearchResult").classed("highlighted", !1), t.select("#locateSearchResult").node().title = "Nothing to locate, enter search term.", 0 !== v.length) {
                        var i, l = [],
                            s = [],
                            p = v.toLowerCase();
                        for (o = 0; o < y.length; o++) {
                            var f = y[o];
                            void 0 !== f && (i = y[o].toLowerCase(), i.indexOf(p) > -1 && (l.push(y[o]), s.push(o)))
                        }
                        for (r = u.node().children, a = r.length, o = 0; o < a; o++) r[0].remove();
                        var h = l;
                        a = l.length, a > b && (a = b);
                        var m = [],
                            k = [];
                        for (o = 0; o < a; o++) {
                            for (var C = 1e8, w = 1e8, S = -1, O = 0; O < h.length; O++) {
                                i = h[O].toLowerCase();
                                var E = i.indexOf(p),
                                    A = i.length;
                                E > -1 && E <= C && A <= w && (S = O, C = E, w = A)
                            }
                            m.push(h[S]), k.push(s[S]), h[S] = ""
                        }
                        for (o = 0; o < a; o++) {
                            var I;
                            I = document.createElement("li"), I.setAttribute("elementID", k[o]), I.setAttribute("class", "dbEntry"), I.onclick = c(k[o]);
                            var D = document.createTextNode(m[o]);
                            I.appendChild(D), u.node().appendChild(I)
                        }
                        g.showSearchEntries()
                    } else
                        for (o = 0; o < a; o++) r[0].remove()
                }

                function c(n) {
                    return function() {
                        var o = n,
                            r = f[o],
                            a = m[o];
                        d.node().value = a, e.resetSearchHighlight(), e.highLightNodes(r), t.select("#locateSearchResult").node().title = "Locate search term", a !== v && l(), g.hideSearchEntries()
                    }
                }
                var d, u, p, f, h, v, g = {},
                    y = [],
                    m = [],
                    b = 6,
                    x = !0,
                    k = !1;
                return String.prototype.beginsWith = function(e) {
                    return 0 === this.indexOf(e)
                }, g.requestDictionaryUpdate = function() {
                    x = !0;
                    for (var e = u.node().children, t = e.length, n = 0; n < t; n++) e[0].remove();
                    d.node().value = ""
                }, g.setup = function() {
                    y = [], d = t.select("#search-input-text"), u = t.select("#searchEntryContainer"), d.on("input", s), d.on("keydown", i), d.on("click", r), d.on("mouseover", o);
                    var n = t.select("#locateSearchResult");
                    n.on("click", function() {
                        e.locateSearchResult()
                    }), n.on("mouseover", function() {
                        g.hideSearchEntries()
                    })
                }, g.hideSearchEntries = function() {
                    u.style("display", "none"), k = !1
                }, g.showSearchEntries = function() {
                    u.style("display", "block"), k = !0
                }, g.getSearchString = function() {
                    return d.node().value
                }, g.clearText = function() {
                    d.node().value = "", t.select("#locateSearchResult").classed("highlighted", !1), t.select("#locateSearchResult").node().title = "Nothing to locate, enter search term.";
                    for (var e = u.node().children, n = e.length, o = 0; o < n; o++) e[0].remove()
                }, g
            }
        }).call(t, n(6))
    },
    329: function(e, t, n) {
        (function(t) {
            e.exports = function(e) {
                function n() {
                    u.on("mouseover", function() {
                        var t = e.options().searchMenu();
                        t.hideSearchEntries()
                    }), p.on("mouseover", function() {
                        var t = e.options().searchMenu();
                        t.hideSearchEntries()
                    }), u.on("click", function() {
                        var e, t, n;
                        if (1 !== c[0]) {
                            var o = c.indexOf(1) - 1,
                                l = c.indexOf(1);
                            for (e = l + 1; e < c.length; e++) c[e] = 0, s[e].style.display = "none";
                            for (c[o] = 1, s[o].style.display = "block", e = l + 1; e < c.length; e++) {
                                if (c[e] = 0, s[e].style.display = "block", t = s[o].getBoundingClientRect().top, n = s[e].getBoundingClientRect().top, t !== n) {
                                    s[e].style.display = "none", c[e] = 0;
                                    break
                                }
                                c[e] = 1
                            }
                            r();
                            var d = a(),
                                u = c.lastIndexOf(1);
                            d || (c[u] = 0, s[u].style.display = "none");
                            var p = c.lastIndexOf(1);
                            for (e = p - 1; e >= 0; e--) {
                                if (c[e] = 0, s[e].style.display = "block", t = s[o].getBoundingClientRect().top, n = s[e].getBoundingClientRect().top, t !== n) {
                                    s[e].style.display = "none", c[e] = 0;
                                    break
                                }
                                c[e] = 1
                            }
                            r(), d = a(), d || (u = c.indexOf(1), u !== -1 && (c[u] = 0, s[u].style.display = "none")), r(), d = a(), d || (u = c.indexOf(1), u !== -1 && (c[u] = 0, s[u].style.display = "none")), r(), d = a(), d || (u = c.indexOf(1), u !== -1 && (c[u] = 0, s[u].style.display = "none")), r(), i()
                        }
                    }), p.on("click", function() {
                        if (1 !== c[c.length - 1]) {
                            var e, t = c.lastIndexOf(1) + 1,
                                n = c.lastIndexOf(1);
                            for (e = n - 1; e >= 0; e--) c[e] = 0, s[e].style.display = "none";
                            for (c[t] = 1, s[t].style.display = "block", e = n - 1; e >= 0; e--) {
                                c[e] = 0, s[e].style.display = "block";
                                var o = s[t].getBoundingClientRect().top,
                                    l = s[e].getBoundingClientRect().top;
                                if (o !== l) {
                                    s[e].style.display = "none", c[e] = 0;
                                    break
                                }
                                c[e] = 1
                            }
                            r();
                            var d = a();
                            if (!d) {
                                var u = c.indexOf(1);
                                u !== -1 && (c[u] = 0, s[u].style.display = "none")
                            }
                            i()
                        }
                    })
                }

                function o() {
                    c[0] = 1, s[0].style.display = "block"
                }

                function r() {
                    var e = s.length - 2,
                        t = s.length - 1;
                    s[e].style.display = "none", s[t].style.display = "none", c.indexOf(0) !== -1 && (s[e].style.display = "block", s[t].style.display = "block")
                }

                function a() {
                    if (c.indexOf(0) === -1) return !0;
                    var e = s.length - 2,
                        t = s.length - 1,
                        n = c.indexOf(1);
                    n === -1 && (o(), n = c.indexOf(1));
                    var r = s[n].getBoundingClientRect().top,
                        a = s[e].getBoundingClientRect().top,
                        i = s[t].getBoundingClientRect().top;
                    s[e].style.display = "block", s[t].style.display = "block";
                    var l = !1;
                    return r === a && r === i && (l = !0), l
                }

                function i() {
                    1 !== c[c.length - 1] ? p.classed("highlighted", !0) : p.classed("highlighted", !1), 1 !== c[0] ? u.classed("highlighted", !0) : u.classed("highlighted", !1)
                }
                var l = {},
                    s = [],
                    c = [],
                    d = t.select("#optionsMenu"),
                    u = t.select("#LeftButton"),
                    p = t.select("#RightButton");
                return l.setup = function() {
                    var e, t = d.node().children;
                    for (e = 0; e < t.length; e++) s.push(t[e]);
                    for (n(), e = 0; e < s.length - 2; e++) s[e].style.display = "block", c[e] = 1
                }, l.updateVisibilityStatus = function() {
                    var e, t = c.indexOf(1);
                    t === -1 && (o(), t = c.indexOf(1));
                    var n, l = s[t].getBoundingClientRect().top;
                    for (e = 0; e < s.length - 2; e++) n = s[e].getBoundingClientRect().top, n === l ? c[e] = 1 : (c[e] = 0, s[e].style.display = "none");
                    var d = c.indexOf(1),
                        u = c.lastIndexOf(1);
                    for (d === -1 && u === -1 && (o(), d = c.indexOf(1), u = c.lastIndexOf(1)), e = d + 1; e < s.length - 2; e++) {
                        if (s[e].style.display = "block", l = s[d].getBoundingClientRect().top, n = s[e].getBoundingClientRect().top, l !== n) {
                            s[e].style.display = "none", c[e] = 0;
                            break
                        }
                        c[e] = 1
                    }
                    r();
                    var p, f = a();
                    if (f || 0 !== d || (p = c.lastIndexOf(1), p !== -1 && (c[p] = 0, s[p].style.display = "none")), 0 !== d || u !== c.length) {
                        if (u = c.lastIndexOf(1), u >= 1) {
                            for (e = u - 1; e >= 0; e--) c[e] = 0, s[e].style.display = "none";
                            for (e = u - 1; e >= 0; e--) {
                                if (c[e] = 0, s[e].style.display = "block", l = s[u].getBoundingClientRect().top, n = s[e].getBoundingClientRect().top, l !== n) {
                                    s[e].style.display = "none", c[e] = 0;
                                    break
                                }
                                c[e] = 1
                            }
                        }
                        r(), f = a(), f || (p = c.indexOf(1), p !== -1 && (c[p] = 0, s[p].style.display = "none"))
                    }
                    c.indexOf(1) === -1 && o(), i()
                }, l
            }
        }).call(t, n(6))
    },
    330: function(e, t, n) {
        (function(t) {
            e.exports = function(e) {
                function n() {
                    function e(e) {
                        e.classed("hidden", !0)
                    }

                    function n(e) {
                        e.classed("hidden", !1)
                    }
                    var o = t.selectAll(".accordion-trigger");
                    e(t.selectAll(".accordion-trigger:not(.accordion-trigger-active) + div")), o.on("click", function() {
                        var o = t.select(this),
                            r = t.selectAll(".accordion-trigger-active");
                        o.classed("accordion-trigger-active") ? (e(t.select(o.node().nextElementSibling)), o.classed("accordion-trigger-active", !1)) : (e(t.selectAll(".accordion-trigger-active + div")), r.classed("accordion-trigger-active", !1), n(t.select(o.node().nextElementSibling)), o.classed("accordion-trigger-active", !0))
                    })
                }

                function o(n) {
                    n = n || [], n.sort(function(e, t) {
                        return e === webvowl.util.constants().LANG_IRIBASED ? -1 : t === webvowl.util.constants().LANG_IRIBASED ? 1 : e === webvowl.util.constants().LANG_UNDEFINED ? -1 : t === webvowl.util.constants().LANG_UNDEFINED ? 1 : e.localeCompare(t)
                    });
                    var o = t.select("#language").on("change", function() {
                        e.language(t.event.target.value), a(), w.updateSelectionInformation(C)
                    });
                    o.selectAll("option").remove(), o.selectAll("option").data(n).enter().append("option").attr("value", function(e) {
                        return e
                    }).text(function(e) {
                        return e
                    }), r(o, n, "en") || r(o, n, webvowl.util.constants().LANG_UNDEFINED) || r(o, n, webvowl.util.constants().LANG_IRIBASED)
                }

                function r(t, n, o) {
                    var r = n.indexOf(o);
                    return r >= 0 && (t.property("selectedIndex", r), e.language(o), !0)
                }

                function a() {
                    var n = S.textInLanguage(k.title, e.language());
                    t.select("#title").text(n || "No title available"), t.select("#about").attr("href", k.iri).attr("target", "_blank").text(k.iri), t.select("#version").text(k.version || "--");
                    var o = k.author;
                    "string" == typeof o ? t.select("#authors").text(o) : o instanceof Array ? t.select("#authors").text(o.join(", ")) : t.select("#authors").text("--");
                    var r = S.textInLanguage(k.description, e.language());
                    t.select("#description").text(r || "No description available.")
                }

                function i(e, n) {
                    e = e || {}, t.select("#classCount").text(e.classCount || n.classCount()), t.select("#objectPropertyCount").text(e.objectPropertyCount || n.objectPropertyCount()), t.select("#datatypePropertyCount").text(e.datatypePropertyCount || n.datatypePropertyCount()), t.select("#individualCount").text(e.totalIndividualCount || n.totalIndividualCount()), t.select("#nodeCount").text(n.nodeCount()), t.select("#edgeCount").text(n.edgeCount())
                }

                function l(e) {
                    var n = t.select("#ontology-metadata");
                    n.selectAll("*").remove(), s(n, e), n.selectAll(".annotation").size() <= 0 && n.append("p").text("No annotations available.")
                }

                function s(e, n) {
                    n = n || {};
                    var o = [];
                    for (var r in n) n.hasOwnProperty(r) && o.push(n[r][0]);
                    e.selectAll(".annotation").remove(), e.selectAll(".annotation").data(o).enter().append("p").classed("annotation", !0).classed("statisticDetails", !0).text(function(e) {
                        return e.identifier + ":"
                    }).append("span").each(function(e) {
                        h(t.select(this), e.value, "iri" === e.type ? e.value : void 0)
                    })
                }

                function c() {
                    d(!1, !1, !0)
                }

                function d(e, n, o) {
                    t.select("#classSelectionInformation").classed("hidden", !e), t.select("#propertySelectionInformation").classed("hidden", !n), t.select("#noSelectionInformation").classed("hidden", !o)
                }

                function u(e) {
                    p(), f(t.select("#propname"), e.labelForCurrentLanguage(), e.iri()), t.select("#typeProp").text(e.type()), void 0 !== e.inverse() ? (t.select("#inverse").classed("hidden", !1), f(t.select("#inverse span"), e.inverse().labelForCurrentLanguage(), e.inverse().iri())) : t.select("#inverse").classed("hidden", !0);
                    var n = t.select("#propEquivUri");
                    b(n, e.equivalents()), b(t.select("#subproperties"), e.subproperties()), b(t.select("#superproperties"), e.superproperties()), void 0 !== e.minCardinality() ? (t.select("#infoCardinality").classed("hidden", !0), t.select("#minCardinality").classed("hidden", !1), t.select("#minCardinality span").text(e.minCardinality()), t.select("#maxCardinality").classed("hidden", !1), void 0 !== e.maxCardinality() ? t.select("#maxCardinality span").text(e.maxCardinality()) : t.select("#maxCardinality span").text("*")) : void 0 !== e.cardinality() ? (t.select("#minCardinality").classed("hidden", !0), t.select("#maxCardinality").classed("hidden", !0), t.select("#infoCardinality").classed("hidden", !1), t.select("#infoCardinality span").text(e.cardinality())) : (t.select("#infoCardinality").classed("hidden", !0), t.select("#minCardinality").classed("hidden", !0), t.select("#maxCardinality").classed("hidden", !0)), f(t.select("#domain"), e.domain().labelForCurrentLanguage(), e.domain().iri()), f(t.select("#range"), e.range().labelForCurrentLanguage(), e.range().iri()), v(e.attributes(), t.select("#propAttributes")), x(t.select("#propDescription"), e.descriptionForCurrentLanguage()), x(t.select("#propComment"), e.commentForCurrentLanguage()), s(t.select("#propertySelectionInformation"), e.annotations())
                }

                function p() {
                    d(!1, !0, !1)
                }

                function f(e, n, o) {
                    var r = t.select(e.node().parentNode);
                    n ? (e.selectAll("*").remove(), h(e, n, o), r.classed("hidden", !1)) : r.classed("hidden", !0)
                }

                function h(e, t, n) {
                    var o;
                    o = n ? e.append("a").attr("href", n).attr("title", n).attr("target", "_blank") : e.append("span"), o.text(t)
                }

                function v(e, n) {
                    var o = t.select(n.node().parentNode);
                    e && e.length > 0 && (g("object", e), g("datatype", e), g("rdf", e)), e && e.length > 0 ? (n.text(e.join(", ")), o.classed("hidden", !1)) : o.classed("hidden", !0)
                }

                function g(e, t) {
                    var n = t.indexOf(e);
                    n > -1 && t.splice(n, 1)
                }

                function y(e) {
                    m(), f(t.select("#name"), e.labelForCurrentLanguage(), e.iri());
                    var n = t.select("#classEquivUri");
                    b(n, e.equivalents()), t.select("#typeNode").text(e.type()), b(t.select("#individuals"), e.individuals());
                    var o = t.select("#disjointNodes"),
                        r = t.select(o.node().parentNode);
                    void 0 !== e.disjointWith() ? (o.selectAll("*").remove(), e.disjointWith().forEach(function(e, t) {
                        t > 0 && o.append("span").text(", "), h(o, e.labelForCurrentLanguage(), e.iri())
                    }), r.classed("hidden", !1)) : r.classed("hidden", !0), v(e.attributes(), t.select("#classAttributes")), x(t.select("#nodeDescription"), e.descriptionForCurrentLanguage()), x(t.select("#nodeComment"), e.commentForCurrentLanguage()), s(t.select("#classSelectionInformation"), e.annotations())
                }

                function m() {
                    d(!0, !1, !1)
                }

                function b(e, n) {
                    var o = t.select(e.node().parentNode);
                    n && n.length ? (e.selectAll("*").remove(), n.forEach(function(t, n) {
                        n > 0 && e.append("span").text(", "), h(e, t.labelForCurrentLanguage(), t.iri())
                    }), o.classed("hidden", !1)) : o.classed("hidden", !0)
                }

                function x(e, n) {
                    var o = t.select(e.node().parentNode),
                        r = !!n;
                    n && e.text(n), o.classed("hidden", !r)
                }
                var k, C, w = {},
                    S = webvowl.util.languageTools(),
                    O = webvowl.util.elementTools();
                return w.setup = function() {
                    n()
                }, w.clearOntologyInformation = function() {
                    t.select("#title").text("No title available"), t.select("#about").attr("href", "#").attr("target", "_blank").text("not given"), t.select("#version").text("--"), t.select("#authors").text("--"), t.select("#description").text("No description available.");
                    var e = t.select("#ontology-metadata");
                    e.selectAll("*").remove(), t.select("#classCount").text("0"), t.select("#objectPropertyCount").text("0"), t.select("#datatypePropertyCount").text("0"), t.select("#individualCount").text("0"), t.select("#nodeCount").text("0"), t.select("#edgeCount").text("0");
                    var n = t.select("#selection-details-trigger").classed("accordion-trigger-active");
                    n && t.select("#selection-details-trigger").node().click(), c()
                }, w.updateOntologyInformation = function(e, t) {
                    e = e || {}, k = e.header || {}, a(), i(e.metrics, t), l(k.other), w.updateSelectionInformation(void 0), o(k.languages)
                }, w.updateSelectionInformation = function(e) {
                    if (C = e, !t.event || !t.event.defaultPrevented) {
                        var n = t.select("#selection-details-trigger").classed("accordion-trigger-active");
                        if (e && !n) t.select("#selection-details-trigger").node().click();
                        else if (!e && n) return void c();
                        O.isProperty(e) ? u(e) : O.isNode(e) && y(e)
                    }
                }, w
            }
        }).call(t, n(6))
    }
});