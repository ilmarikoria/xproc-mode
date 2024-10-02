;;;; xproc.el --- GNU Emacs minor mode for creating XProc pipelines
;; Copyright (C) 2024 Ilmari Koria

;; Author: Ilmari Koria
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

(defun xproc-add-step-boilerplate ()
  "Insert XProc v3 step boilerplate"
  (interactive)
  (insert "<p:declare-step xmlns:p=\"http://www.w3.org/ns/xproc\"
                version=\"3.0\"\n")
  (let ((p (point)))
  (insert "</p:declare-step>\n")
  (goto-char p)))

(define-derived-mode xproc-mode nxml-mode "xproc"
  "minor mode for creating XProc pipelines."
  (setq auto-mode-alist
        (append
         '(("\\.xpl\\'" . xproc-mode))
         auto-mode-alist)))

;;; xproc.el ends here
