(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
  (evil-mode 1)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4d75b7a1c01684d3a5870dedd4f29063e1d9ffc7dd2e445e5edbbb842ce3933e" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:background "#282828" :foreground "dark gray")))))
(load-theme 'smyx)
(tool-bar-mode -1)
(require 'evil-leader)
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key "t" 'fiplr-find-file)
(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))
(evil-leader/set-key "c" 'delete-trailing-whitespace)
(evil-leader/set-key "f" 'copy-file-name-to-clipboard)
(require 'package)
(package-initialize)
;; helm settings (TAB in helm window for actions over selected items,
;; C-SPC to select items)
(global-set-key (kbd "C-x f") 'fiplr-find-file)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.es6\\'" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(setq web-mode-engines-alist
      '(("ctemplate"    . "\\.hbs\\'")
        ("ctemplate"    . "\\.html\\'")
      )
)
(setq backup-directory-alist `(("." . "~/.saves")))
(define-key evil-normal-state-map (kbd "S-<SPC>") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "<SPC>") 'evil-scroll-down)
(setq-default show-trailing-whitespace t)
(global-evil-tabs-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq ns-use-srgb-colorspace t)
;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
; (set-frame-parameter (selected-frame) 'alpha '(80 50))
; (add-to-list 'default-frame-alist '(alpha 80 50))
(add-hook 'python-mode-hook
  (function (lambda ()
          (setq evil-shift-width python-indent))))
(add-hook 'ruby-mode-hook
  (function (lambda ()
          (setq evil-shift-width ruby-indent-level))))

(set-default-font "Menlo 14")
(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(global-linum-mode t)
(setq js-indent-level 2)
(setq sgml-basic-offset 2)
(electric-indent-mode +1)
