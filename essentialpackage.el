;;----------------------------------------------------------------------------
;;color-theme
(load-file "~/myemacs/color-theme/color-theme.el")
(require 'color-theme)
(color-theme-dark-blue)
;;(set-face-background 'default "LightCyan3") ;;
;;----------------------------------------------------------------------------
;;(add-to-list 'load-path "~/myemacs/point-undo/")
;;(require 'point-undo)
;;(global-set-key [M-left] 'point-undo)
;;(global-set-key [M-right] 'point-redo)
;;----------------------------------------------------------------------------
;;go to last edit point
(load-file "~/myemacs/goto-last-change/goto-last-change.el")
(require 'goto-last-change)
(global-set-key [(meta p)(u)] 'goto-last-change)
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/frame")
(load-file "~/myemacs/frame/frame-cmds.el")
(global-set-key [(control up)] 'move-frame-up)
(global-set-key [(control down)] 'move-frame-down)
(global-set-key [(control left)] 'move-frame-left)
(global-set-key [(control right)] 'move-frame-right)
;;----------------------------------------------------------------------------
(load-file "~/myemacs/bm/bm-1.34.el")
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)
;;move the current line up or down
(global-set-key [(meta up)] 'move-line-up)
(global-set-key [(meta down)] 'move-line-down)

(defun move-line (&optional n)
 "Move current line N (1) lines up/down leaving point in place."
 (interactive "p")
 (when (null n)
    (setq n 1))
 (let ((col (current-column)))
    (beginning-of-line)
    (next-line 1)
    (transpose-lines n)
    (previous-line 1)
    (forward-char col)))
(defun move-line-up (n)
 "Moves current line N (1) lines up leaving point in place."
 (interactive "p")
 (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
 "Moves current line N (1) lines down leaving point in place."
 (interactive "p")
 (move-line (if (null n) 1 n)))
;;----------------------------------------------------------------------------
;;(add-to-list 'load-path "~/myemacs/yasnippet-bundle-0.5.6.el")
;;(require 'yasnippet-bundle)
;;----------------------------------------------------------------------------
;;(load-file "~/myemacs/csharp/csharp-mode-0.4.0.el");;C#
;; C/C++/Java/C# Mode
(defun my-c-mode-common-hook ()
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'statement-cont 4)
  (c-set-offset 'topmost-intro-cont 0)
  (c-set-offset 'block-open 0)
  (c-set-offset 'arglist-intro 4)
  (c-set-offset 'arglist-cont-nonempty 4)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(defun my-csharp-mode-hook ()
  (progn
   (turn-on-font-lock)
   (auto-fill-mode)
   (setq tab-width 4)
   (define-key csharp-mode-map "\t" 'c-tab-indent-or-complete)))
;;(add-hook 'csharp-mode-hook 'my-csharp-mode-hook)
;;----------------------------------------------------------------------------
(setq load-path (cons "~/myemacs/org-6.34c/lisp" load-path))
(setq load-path (cons "~/myemacs/org-6.34c/contrib/lisp" load-path))
(require 'org)
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;set orgmode agenda files
(add-to-list 'org-agenda-files "~/myemacs/data/jason-todo.org")

(add-hook 'org-mode-hook 'turn-on-font-lock)  ;; activate font-lock-mode
(setq org-todo-keyword-faces
      '(("TODO"      . org-warning)
        ("DEFERRED"  . shadow)
        ("CANCELED"  . (:foreground "blue" :weight bold))))

(setq org-log-done t) 
(setq org-export-headline-levels 5);;set export headline level
;;set export css
(setq org-export-html-style
"<style type=\"text/css\">
@media all
{
  body {
    font:0.9em serif;
    max-width: 95%;
    margin: auto;
    background-image: url(http://orgmode.org/worg-unicorn.png);
    background-repeat: no-repeat;
    }
    body #content {
      padding-top: 45px;
    }
    body .title {
      margin-left: 120px;
    }

  /* TOC inspired by http://jashkenas.github.com/coffee-script */
  #table-of-contents {
    font-size: 10pt;
    position: fixed;
    right: 0em;
    top: 0em;
    background: white;
    -webkit-box-shadow: 0 0 1em #777777;
    -moz-box-shadow: 0 0 1em #777777;
    -webkit-border-bottom-left-radius: 5px;
    -moz-border-radius-bottomleft: 5px;
    text-align: right;
    /* ensure doesn't flow off the screen when expanded */
    max-height: 80%;
    overflow: auto; }
    #table-of-contents h2 {
      font-size: 10pt;
      max-width: 8em;
      font-weight: normal;
      padding-left: 0.5em;
      padding-left: 0.5em;
      padding-top: 0.05em;
      padding-bottom: 0.05em; }
    #table-of-contents #text-table-of-contents {
      display: none;
      text-align: left; }
    #table-of-contents:hover #text-table-of-contents {
      display: block;
      padding: 0.5em;
      margin-top: -1.5em; }

  #license {
    padding: .3em;
    border: 1px solid grey;
    background-color: #eeeeee;
  }

  h1 {
    font-family:Sans;
    font-size:2.1em;
    font-weight:bold;
    padding:0 0 30px 0;
    margin-top: 10px;
    margin-bottom: 10px;
    margin-right: 7%;
  }

/*
  h2:before {
    content: \"* \"
  }

  h3:before {
    content: \"** \"
  }

  h4:before {
    content: \"*** \"
  }

  h5:before {
    content: \"**** \"
  }

  h6:before {
    content: \"**** \"
  }
*/

  h2 {
    font-family:Arial,sans-serif;
    font-size:1.45em;
    font-weight:bold;
    line-height:16px;
    padding:7px 0 0 0;
    color: #7C0000;
  }

  .outline-text-2 {
    margin-left: 0.1em
  }

  .title {

  }

  h3 {
    font-family:Arial,sans-serif;
    font-size:1.3em;
    font-weight:bold;
    color: #00046E;
    margin-left: 0.6em;
  }

  .outline-text-3 {
    margin-left: 0.9em;
  }

  h4 {
    font-family:Arial,sans-serif;
    font-size:1.2em;
    font-weight:bold;
    margin-left: 1.2em;
    color: #00574F;
  }

  .outline-text-4 {
    margin-left: 1.45em;
  }

  h5 {
    font-family:Arial,sans-serif;
    font-size:1.2em;
    font-weight:bold;
    margin-left: 1.8em;
    color: #5f9ea0;
  }

  .outline-text-5 {
    margin-left: 2.05em;
  }

  h6 {
    font-family:Arial,sans-serif;
    font-size:1.0em;
    font-weight:bold;
    margin-left: 2.4em;
    color: #5f9ea0;
  }

  .outline-text-6 {
    margin-left: 2.65em;
  }

  a {
    text-decoration: none;
  }

  a:visited {
    text-decoration: none;
 }

  a:hover {

  }

  .todo {
    color: #CA0000;
  }

  .done {
    color: #006666;
  }

  .timestamp-kwd {
    color: #444;
  }

  .tag {

  }

  li {
    margin: .4em;
  }

  table {
    border: 1px solid grey;
  }

  td {
    border: none;
  }

  th {
    border: none;
  }

  code {
    font-size: 100%;
  }

  img {
    border: none;
  }

  .share img {
    opacity: .4;
    -moz-opacity: .4;
    filter: alpha(opacity=40);
  }

  .share img:hover {
    opacity: 1;
    -moz-opacity: 1;
    filter: alpha(opacity=100);
  }

  /* pre {border: 1px solid #555; */
  /*      background: #EEE; */
  /*      font-size: 9pt; */
  /*      padding: 1em; */
  /*     } */

  /* pre { */
  /*     color: #e5e5e5; */
  /*     background-color: #000000; */
  /*     padding: 1.4em; */
  /*     border: 2px solid grey; */
  /* } */

  /* pre { */
  /*     background-color: #2b2b2b; */
  /*     border: 4px solid grey; */
  /*     color: #EEE; */
  /*     overflow: auto; */
  /*     padding: 1em; */
  /*  } */

  pre {
    color: black;
    background-color: #efefef;
    padding: 1.2em;
    border: 1px solid #dddddd;
    overflow: auto;
  }

  .org-info-box {
    clear:both;
    margin-left:auto;
    margin-right:auto;
    padding:0.7em;
    /* border:1px solid #CCC; */
    /* border-radius:10px; */
    /* -moz-border-radius:10px; */
  }
  .org-info-box img {
    float:left;
    margin:0em 0.5em 0em 0em;
  }
  .org-info-box p {
    margin:0em;
    padding:0em;
  }


  .builtin {
    /* font-lock-builtin-face */
    color: #f4a460;
  }
  .comment {
    /* font-lock-comment-face */
    color: #737373;
  }
  .comment-delimiter {
    /* font-lock-comment-delimiter-face */
    color: #666666;
  }
  .constant {
    /* font-lock-constant-face */
    color: #db7093;
  }
  .doc {
    /* font-lock-doc-face */
    color: #b3b3b3;
  }
  .function-name {
    /* font-lock-function-name-face */
    color: #5f9ea0;
  }
  .headline {
    /* headline-face */
    color: #ffffff;
    background-color: #000000;
    font-weight: bold;
  }
  .keyword {
    /* font-lock-keyword-face */
    color: #4682b4;
  }
  .negation-char {
  }
  .regexp-grouping-backslash {
  }
  .regexp-grouping-construct {
  }
  .string {
    /* font-lock-string-face */
    color: #ccc79a;
  }
  .todo-comment {
    /* todo-comment-face */
    color: #ffffff;
    background-color: #000000;
    font-weight: bold;
  }
  .variable-name {
    /* font-lock-variable-name-face */
    color: #ff6a6a;
  }
  .warning {
    /* font-lock-warning-face */
    color: #ffffff;
    background-color: #cd5c5c;
    font-weight: bold;
  }
  pre.a {
    color: inherit;
    background-color: inherit;
    font: inherit;
    text-decoration: inherit;
  }
  pre.a:hover {
    text-decoration: underline;
  }

  /* Styles for org-info.js */

  .org-info-js_info-navigation
  {
    border-style:none;
  }

  #org-info-js_console-label
  {
    font-size:10px;
    font-weight:bold;
    white-space:nowrap;
  }

  .org-info-js_search-highlight
  {
    background-color:#ffff00;
    color:#000000;
    font-weight:bold;
  }

  #org-info-js-window
  {
    border-bottom:1px solid black;
    padding-bottom:10px;
    margin-bottom:10px;
  }



  .org-info-search-highlight
  {
    background-color:#adefef; /* same color as emacs default */
    color:#000000;
    font-weight:bold;
  }

  .org-bbdb-company {
    /* bbdb-company */
    font-style: italic;
  }
  .org-bbdb-field-name {
  }
  .org-bbdb-field-value {
  }
  .org-bbdb-name {
    /* bbdb-name */
    text-decoration: underline;
  }
  .org-bold {
    /* bold */
    font-weight: bold;
  }
  .org-bold-italic {
    /* bold-italic */
    font-weight: bold;
    font-style: italic;
  }
  .org-border {
    /* border */
    background-color: #000000;
  }
  .org-buffer-menu-buffer {
    /* buffer-menu-buffer */
    font-weight: bold;
  }
  .org-builtin {
    /* font-lock-builtin-face */
    color: #da70d6;
  }
  .org-button {
    /* button */
    text-decoration: underline;
  }
  .org-c-nonbreakable-space {
    /* c-nonbreakable-space-face */
    background-color: #ff0000;
    font-weight: bold;
  }
  .org-calendar-today {
    /* calendar-today */
    text-decoration: underline;
  }
  .org-comment {
    /* font-lock-comment-face */
    color: #b22222;
  }
  .org-comment-delimiter {
    /* font-lock-comment-delimiter-face */
    color: #b22222;
  }
  .org-constant {
    /* font-lock-constant-face */
    color: #5f9ea0;
  }
  .org-cursor {
    /* cursor */
    background-color: #000000;
  }
  .org-default {
    /* default */
    color: #000000;
    background-color: #ffffff;
  }
  .org-diary {
    /* diary */
    color: #ff0000;
  }
  .org-doc {
    /* font-lock-doc-face */
    color: #bc8f8f;
  }
  .org-escape-glyph {
    /* escape-glyph */
    color: #a52a2a;
  }
  .org-file-name-shadow {
    /* file-name-shadow */
    color: #7f7f7f;
  }
  .org-fixed-pitch {
  }
  .org-fringe {
    /* fringe */
    background-color: #f2f2f2;
  }
  .org-function-name {
    /* font-lock-function-name-face */
    color: #0000ff;
  }
  .org-header-line {
    /* header-line */
    color: #333333;
    background-color: #e5e5e5;
  }
  .org-help-argument-name {
    /* help-argument-name */
    font-style: italic;
  }
  .org-highlight {
    /* highlight */
    background-color: #b4eeb4;
  }
  .org-holiday {
    /* holiday */
    background-color: #ffc0cb;
  }
  .org-info-header-node {
    /* info-header-node */
    color: #a52a2a;
    font-weight: bold;
    font-style: italic;
  }
  .org-info-header-xref {
    /* info-header-xref */
    color: #0000ff;
    text-decoration: underline;
  }
  .org-info-menu-header {
    /* info-menu-header */
    font-weight: bold;
  }
  .org-info-menu-star {
    /* info-menu-star */
    color: #ff0000;
  }
  .org-info-node {
    /* info-node */
    color: #a52a2a;
    font-weight: bold;
    font-style: italic;
  }
  .org-info-title-1 {
    /* info-title-1 */
    font-size: 172%;
    font-weight: bold;
  }
  .org-info-title-2 {
    /* info-title-2 */
    font-size: 144%;
    font-weight: bold;
  }
  .org-info-title-3 {
    /* info-title-3 */
    font-size: 120%;
    font-weight: bold;
  }
  .org-info-title-4 {
    /* info-title-4 */
    font-weight: bold;
  }
  .org-info-xref {
    /* info-xref */
    color: #0000ff;
    text-decoration: underline;
  }
  .org-isearch {
   /* isearch */
    color: #b0e2ff;
    background-color: #cd00cd;
  }
  .org-italic {
    /* italic */
    font-style: italic;
  }
  .org-keyword {
    /* font-lock-keyword-face */
    color: #a020f0;
  }
  .org-lazy-highlight {
    /* lazy-highlight */
    background-color: #afeeee;
  }
  .org-link {
    /* link */
    color: #0000ff;
    text-decoration: underline;
  }
  .org-link-visited {
    /* link-visited */
    color: #8b008b;
    text-decoration: underline;
  }
  .org-match {
    /* match */
    background-color: #ffff00;
  }
  .org-menu {
  }
  .org-message-cited-text {
    /* message-cited-text */
    color: #ff0000;
  }
  .org-message-header-cc {
    /* message-header-cc */
    color: #191970;
  }
  .org-message-header-name {
    /* message-header-name */
    color: #6495ed;
  }
  .org-message-header-newsgroups {
    /* message-header-newsgroups */
    color: #00008b;
    font-weight: bold;
    font-style: italic;
  }
  .org-message-header-other {
    /* message-header-other */
    color: #4682b4;
  }
  .org-message-header-subject {
    /* message-header-subject */
    color: #000080;
    font-weight: bold;
  }
  .org-message-header-to {
    /* message-header-to */
    color: #191970;
    font-weight: bold;
  }
  .org-message-header-xheader {
    /* message-header-xheader */
    color: #0000ff;
  }
  .org-message-mml {
    /* message-mml */
    color: #228b22;
  }
  .org-message-separator {
    /* message-separator */
    color: #a52a2a;
  }
  .org-minibuffer-prompt {
    /* minibuffer-prompt */
    color: #0000cd;
  }
  .org-mm-uu-extract {
    /* mm-uu-extract */
    color: #006400;
    background-color: #ffffe0;
  }
  .org-mode-line {
    /* mode-line */
    color: #000000;
    background-color: #bfbfbf;
  }
  .org-mode-line-buffer-id {
    /* mode-line-buffer-id */
    font-weight: bold;
  }
  .org-mode-line-highlight {
  }
  .org-mode-line-inactive {
    /* mode-line-inactive */
    color: #333333;
    background-color: #e5e5e5;
  }
  .org-mouse {
    /* mouse */
    background-color: #000000;
  }
  .org-negation-char {
  }
  .org-next-error {
    /* next-error */
    background-color: #eedc82;
  }
  .org-nobreak-space {
    /* nobreak-space */
    color: #a52a2a;
    text-decoration: underline;
  }
  .org-org-agenda-date {
    /* org-agenda-date */
    color: #0000ff;
  }
  .org-org-agenda-date-weekend {
    /* org-agenda-date-weekend */
    color: #0000ff;
    font-weight: bold;
  }
  .org-org-agenda-restriction-lock {
    /* org-agenda-restriction-lock */
    background-color: #ffff00;
  }
  .org-org-agenda-structure {
    /* org-agenda-structure */
    color: #0000ff;
  }
  .org-org-archived {
    /* org-archived */
    color: #7f7f7f;
  }
  .org-org-code {
    /* org-code */
    color: #7f7f7f;
  }
  .org-org-column {
    /* org-column */
    background-color: #e5e5e5;
  }
  .org-org-column-title {
    /* org-column-title */
    background-color: #e5e5e5;
    font-weight: bold;
    text-decoration: underline;
  }
  .org-org-date {
    /* org-date */
    color: #a020f0;
    text-decoration: underline;
  }
  .org-org-done {
    /* org-done */
    color: #228b22;
    font-weight: bold;
  }
  .org-org-drawer {
    /* org-drawer */
    color: #0000ff;
  }
  .org-org-ellipsis {
    /* org-ellipsis */
    color: #b8860b;
    text-decoration: underline;
  }
  .org-org-formula {
    /* org-formula */
    color: #b22222;
  }
  .org-org-headline-done {
    /* org-headline-done */
    color: #bc8f8f;
  }
  .org-org-hide {
    /* org-hide */
    color: #e5e5e5;
  }
  .org-org-latex-and-export-specials {
    /* org-latex-and-export-specials */
    color: #8b4513;
  }
  .org-org-level-1 {
    /* org-level-1 */
    color: #0000ff;
  }
  .org-org-level-2 {
    /* org-level-2 */
    color: #b8860b;
  }
  .org-org-level-3 {
    /* org-level-3 */
    color: #a020f0;
  }
  .org-org-level-4 {
    /* org-level-4 */
    color: #b22222;
  }
  .org-org-level-5 {
    /* org-level-5 */
    color: #228b22;
  }
  .org-org-level-6 {
    /* org-level-6 */
    color: #5f9ea0;
  }
  .org-org-level-7 {
    /* org-level-7 */
    color: #da70d6;
  }
  .org-org-level-8 {
    /* org-level-8 */
    color: #bc8f8f;
  }
  .org-org-link {
    /* org-link */
    color: #a020f0;
    text-decoration: underline;
  }
  .org-org-property-value {
  }
  .org-org-scheduled-previously {
    /* org-scheduled-previously */
    color: #b22222;
  }
  .org-org-scheduled-today {
    /* org-scheduled-today */
    color: #006400;
  }
  .org-org-sexp-date {
    /* org-sexp-date */
   color: #a020f0;
  }
  .org-org-special-keyword {
    /* org-special-keyword */
    color: #bc8f8f;
  }
  .org-org-table {
    /* org-table */
    color: #0000ff;
  }
  .org-org-tag {
    /* org-tag */
    font-weight: bold;
  }
  .org-org-target {
    /* org-target */
    text-decoration: underline;
  }
  .org-org-time-grid {
    /* org-time-grid */
    color: #b8860b;
  }
  .org-org-todo {
    /* org-todo */
    color: #ff0000;
  }
  .org-org-upcoming-deadline {
    /* org-upcoming-deadline */
    color: #b22222;
  }
  .org-org-verbatim {
    /* org-verbatim */
    color: #7f7f7f;
    text-decoration: underline;
  }
  .org-org-warning {
    /* org-warning */
    color: #ff0000;
    font-weight: bold;
  }
  .org-outline-1 {
    /* outline-1 */
    color: #0000ff;
  }
  .org-outline-2 {
    /* outline-2 */
    color: #b8860b;
  }
  .org-outline-3 {
    /* outline-3 */
    color: #a020f0;
  }
  .org-outline-4 {
    /* outline-4 */
    color: #b22222;
  }
  .org-outline-5 {
    /* outline-5 */
    color: #228b22;
  }
  .org-outline-6 {
    /* outline-6 */
    color: #5f9ea0;
  }
  .org-outline-7 {
    /* outline-7 */
    color: #da70d6;
  }
  .org-outline-8 {
    /* outline-8 */
    color: #bc8f8f;
  }
  .outline-text-1, .outline-text-2, .outline-text-3, .outline-text-4, .outline-text-5, .outline-text-6 {
    /* Add more spacing between section. Padding, so that folding with org-info.js works as expected. */

  }

  .org-preprocessor {
    /* font-lock-preprocessor-face */
    color: #da70d6;
  }
  .org-query-replace {
    /* query-replace */
    color: #b0e2ff;
    background-color: #cd00cd;
  }
  .org-regexp-grouping-backslash {
    /* font-lock-regexp-grouping-backslash */
    font-weight: bold;
  }
  .org-regexp-grouping-construct {
    /* font-lock-regexp-grouping-construct */
    font-weight: bold;
  }
  .org-region {
    /* region */
    background-color: #eedc82;
  }
  .org-rmail-highlight {
  }
  .org-scroll-bar {
    /* scroll-bar */
    background-color: #bfbfbf;
  }
  .org-secondary-selection {
    /* secondary-selection */
    background-color: #ffff00;
  }
  .org-shadow {
    /* shadow */
    color: #7f7f7f;
  }
  .org-show-paren-match {
    /* show-paren-match */
    background-color: #40e0d0;
  }
  .org-show-paren-mismatch {
    /* show-paren-mismatch */
    color: #ffffff;
    background-color: #a020f0;
  }
  .org-string {
    /* font-lock-string-face */
    color: #bc8f8f;
  }
  .org-texinfo-heading {
    /* texinfo-heading */
    color: #0000ff;
  }
  .org-tool-bar {
    /* tool-bar */
    color: #000000;
    background-color: #bfbfbf;
  }
  .org-tooltip {
    /* tooltip */
    color: #000000;
    background-color: #ffffe0;
  }
  .org-trailing-whitespace {
    /* trailing-whitespace */
    background-color: #ff0000;
  }
  .org-type {
    /* font-lock-type-face */
    color: #228b22;
  }
  .org-underline {
    /* underline */
    text-decoration: underline;
  }
  .org-variable-name {
    /* font-lock-variable-name-face */
    color: #b8860b;
  }
  .org-variable-pitch {
  }
  .org-vertical-border {
  }
  .org-warning {
    /* font-lock-warning-face */
    color: #ff0000;
    font-weight: bold;
  }
  .rss_box {}
  .rss_title, rss_title a {}
  .rss_items {}
  .rss_item a:link, .rss_item a:visited, .rss_item a:active {}
  .rss_item a:hover {}
  .rss_date {}

  .src {
    font-family:Arial,sans-serif;
    font-size:1.05em;
  }
} /* END OF @media all */



@media screen
{
  #table-of-contents {
    float: right;
    border: 1px solid #CCC;
    max-width: 50%;
    overflow: auto;
  }
} /* END OF @media screen */
</Style>"
)
;;----------------------------------------------------------------------------
(add-to-list 'load-path "~/myemacs/bbdb-2.35/lisp")
(require 'bbdb)
(bbdb-initialize)
(load-file "~/myemacs/bbdb-2.35/bbdb-xml-print.el")
(setq bbdb-file "~/myemacs/data/filebat.bbdb")
(require 'bbdb-xml-print)
;;----------------------------------------------------------------------------
;;etags
(setq tags-file-name "~/myemacs/data/TAGS")
;;----------------------------------------------------------------------------
;;ledger
(add-to-list 'load-path "~/myemacs/ledger")
(load "ledger")
(add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))
;;----------------------------------------------------------------------------
;;(add-to-list 'load-path "~/myemacs/psvn")
;;(require 'psvn)
;;----------------------------------------------------------------------------
(load-file "~/myemacs/sr-speedbar.el")
(require 'sr-speedbar)
(global-set-key (kbd "<f3>") 'sr-speedbar-toggle)
;;----------------------------------------------------------------------------

