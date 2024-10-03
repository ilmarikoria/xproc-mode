;;;; xproc.el --- major mode for creating XProc pipelines
;; Copyright (C) 2024 Ilmari Koria

;; Contributor(s): Ilmari Koria
;; Created: 02 Oct 2024
;; Keywords: xml, pipelines, xsl, publishing

;;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; boilerplate stuff
(defun xproc-add-step-boilerplate ()
  "Insert XProc v3 step boilerplate at point"
  (interactive)
  (insert "<p:declare-step xmlns:p=\"http://www.w3.org/ns/xproc\"
                version=\"3.0\"\n")
  (let ((p (point)))
  (insert "</p:declare-step>\n")
  (goto-char p)))

(defun xproc-insert-input-port (input-port)
  "Insert primary input port at point"
  (interactive "sEnter port name: ")
  (insert 
   (format "\n<p:input port=\"%s\" primary=\"true\"/>\n"
           input-port)))

(defun xproc-insert-output-port (output-port)
  "Insert primary output port at point"
  (interactive "sEnter port name: ")
  (insert 
   (format "\n<p:output port=\"%s\" primary=\"true\"/>\n"
           output-port)))

(defun xproc-insert-primary-in-out-ports ()
  "Insert primary input and output port at point"
  (interactive)
  (insert  "\n<p:input port=\"source\" primary=\"true\"/>\n
              <p:output port=\"result\" primary=\"true\"/>\n"))

(defun xproc-add-step (step)
  "Insert step at point"
  (interactive "sEnter step type: ")
  (insert (format "\n<p:%s>\n" step))
  (let ((p (point)))
    (insert (format "\n</p:%s>\n" step))
    (goto-char p)))

(define-derived-mode xproc-mode nxml-mode "xproc"
  "major mode for creating XProc pipelines."
  (setq auto-mode-alist
        (append
         '(("\\.xpl\\'" . xproc-mode))
         auto-mode-alist))
  (setq imenu-create-index-function 'xproc-imenu-create-index-function)
  (setq imenu-extract-index-name-function 'xproc-imenu-create-index-function)
  (imenu-add-to-menubar "XProc/Steps"))

;;; xproc.el ends here
