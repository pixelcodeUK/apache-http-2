!function(e,t,a){Object.keys(e.interfaces).forEach(function(t){var n=e.interfaces[t];e.interfaces[t]=function(t){n.apply(this,arguments);var i=e.Suite,r=e.Test;t.on("pre-require",function(e,n,o){e.a11ySuite=function(e,o){var s=document.getElementById(e);if(s){var c=new a.AuditConfiguration;c.scope=document.body,c.showUnsupportedRulesWarning=!1,c.auditRulesToIgnore=o;var u=i.create(t,"A11y Audit - Fixture: "+e);return u.eachTest=function(){s.create();var e=a.Audit.run(c);e.forEach(function(e,t){if("NA"!==e.result){var i=e.rule.heading,o="FAIL"===e.result?a.Audit.accessibilityErrorMessage(e):null,s=new r(i,function(){if(o)throw new Error(o)});s.file=n,u.addTest(s)}}),s.restore(),t.eachTest.apply(u,arguments),this.eachTest=t.eachTest},u}}})}}),t.use(function(e,t){var n=e.Assertion;e.assert.a11yLabel=function(e,t,a){new n(e).to.have.a11yLabel(t,a)},n.addMethod("a11yLabel",function(e,i){i&&t.flag(this,"message",i);var r=this._obj;new n(r).to.be.instanceOf(Node);var o=a.properties.findTextAlternatives(r,{});this.assert(o===e,"expected #{this} to have text alternative #{exp} but got #{act}","expected #{this} to not have text alternative #{act}",e,o,!0)})})}(window.Mocha,window.chai,window.axs);