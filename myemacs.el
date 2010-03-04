(load-file "~/myemacs/windowsonly.el") ;;�������Լ����������elips�ļ�,ʹ��ʱ��������ע�͵�����
(load-file "~/myemacs/essentialpackage.el")
(load-file "~/myemacs/otherpackage.el")
(load-file "~/myemacs/largepackage.el")
(load-file "~/myemacs/programming.el")
(load-file "~/myemacs/beta.el")
(load-file "~/myemacs/personal.el")
;;(load-file "~/myemacs/seldom.el")
;;----------------------------------------------------------------------------
(set-language-environment "Chinese-GB18030")
;;(create-fontset-from-fontset-spec "-*-*-*-*-*-*-19-*-*-*-*-*-fontset-filebat")  ;;very funny font
(create-fontset-from-fontset-spec "-outline-courier new-normal-r-normal-normal-17-97-96-96-c-*-fontset-filebat")
(setq default-frame-alist
      (append
       '((font . "fontset-filebat")
         (foreground-color . "Wheat")
         (background-color . "DarkSlateGray")
         (cursor-color     . "Orchid")
         )
       default-frame-alist))
;;----------------------------------------------------------------------------
(setq x-select-enable-clipboard t) ;֧��emacs���ⲿ�����ճ��
(setq inhibit-startup-message t) ; �ر�emacs����ʱ�Ļ���
;;��ֹҳ�����ʱ������ scroll-margin 3 �����ڿ�����Ļ����3��ʱ�Ϳ�ʼ���������ԺܺõĿ��������ġ�
(setq default-tab-width 4);;����tab��Ϊ4���ո�
(setq scroll-margin 3 scroll-conservatively 10000)
(setq frame-title-format '("" buffer-file-name "@emacs" ));�ڱ�������ʾbuffer����
(fset 'yes-or-no-p 'y-or-n-p);;y��ʾyes, n��ʾno
(setq visible-bell t) ;;�رշ��˵ĳ���ʱ����ʾ��
(display-time-mode 1);��ʾʱ�䣬��ʽ����
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(global-font-lock-mode t);�﷨����
(show-paren-mode t);��ʾ����ƥ��
(setq column-number-mode t) ;��ʾ�к�
(set-fill-column 120)
(setq outline-minor-mode-prefix (kbd "C-o"))
(setq backup-directory-alist '(("." . "~/tmp")));��Щ��ʱ�ļ��ŵ�ͬһ��Ŀ¼��
;;����100���Զ�����
(setq auto-save-interval 100)
(transient-mark-mode t);;��Windows�±༭������, ������ʾҪ����������
;;(custom-set-variables '(line-spacing 5));�����м��
(global-set-key [C-tab] 'other-window)                    ; �л�����
(global-set-key [M-return] 'delete-other-windows)         ; �ر���������
(global-set-key [(meta g)] 'goto-line);;M-g����ָ����
(desktop-save-mode 1) ;;�Զ����ϴδ򿪵��ļ�
(setq inhibit-startup-message t) ;;ȥ��������ӭ����
(autoload 'thumbs "thumbs" "Preview images in a directory." t)
(setq debug-on-error t);;enter debugger if an error is signaled
(setq case-fold-search t);;Make searches case insensitive
(iswitchb-mode 1);;interactive buffer switching
;;(setq-default make-backup-files nil);;��Ҫ������ʱ�ļ�
;;----------------------------------------------------------------------------
;;grep-find skip .svn directory
(setq grep-find-command " find . -name \".svn\" -prune -o -type f -print0 | xargs -0 -e grep -nH -e ")
;;find-name-dired skip .svn directory
(setq find-ls-option '("-exec ls -ld \"{}\" \";\" | grep -v ./.svn" . "-ld"))
;;----------------------------------------------------------------------------
;;show recent files
(require 'recentf)
(recentf-mode 1)
(defun recentf-open-files-compl ()
  (interactive)
  (let* ((all-files recentf-list)
         (tocpl (mapcar (function
                         (lambda (x) (cons (file-name-nondirectory x) x))) all-files))
         (prompt (append '("File name: ") tocpl))
         (fname (completing-read (car prompt) (cdr prompt) nil nil)))
    (find-file (cdr (assoc-ignore-representation fname tocpl)))))
(global-set-key [(control x)(control r)] 'recentf-open-files-compl)
;;----------------------------------------------------------------------------
;;never quit by mistake...
(global-set-key [(control x) (control c)]
  (function
   (lambda () (interactive)
     (cond ((y-or-n-p "Quit editor? ")
            (save-buffers-kill-emacs))))))
;;never hide by mistake...
(global-set-key [(control z)]
  (function
   (lambda () (interactive)
     (cond ((y-or-n-p "Hide editor? ")
            (iconify-or-deiconify-frame))))))
;;----------------------------------------------------------------------------
;;��ݼ�
(global-set-key [f1] 'describe-function) ;;elisp����˵��

(global-set-key (kbd "<f7>") 'compile)
(global-set-key (kbd "<f8>") 'gdb)
(global-set-key [C-f12] 'comment-or-uncomment-region)     ; ע�� / ȡ��ע��
(global-set-key [f12] 'c-indent-line-or-region); ��ʽ������
;;----------------------------------------------------------------------------
;;diary
(global-set-key [f4] 'calendar)
;;(setq diary-file "~/myemacs/data/jason-todo.org")
;;----------------------------------------------------------------------------
;;�۵����� hide and show code block
;;(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'java-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook 'hs-minor-mode)
(global-set-key (kbd "<f9>") 'hs-toggle-hiding)
;;----------------------------------------------------------------------------
;; hippie-expand �Ĳ�ȫ��ʽ������һ�������б� hippie-expand ������ʹ�ñ���ǰ��ĺ�������ȫ��
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))
;;----------------------------------------------------------------------------
;;��alt+p tab��, tabѡ������, ʵ������ÿ�����װ�tab����ͬ����
(define-key global-map  (kbd "M-p TAB")   'my-tab-all)
;;(global-set-key [?\M-p  \t] 'my-tab-all)
(defun my-tab-all (beginning end)
  (interactive "r")
  (save-excursion
    (if (< end beginning)
        (let (tmp beginning)
          (beginning end)
          (end tmp)))
    (goto-char beginning)
    (while (< (point) end)
      (yas/expand)
      (forward-line 1)
      )
    )
  )
;;----------------------------------------------------------------------------
;;��alt+p e, ɾ����ǰ��,������������������
(global-set-key [(meta p)(e)] 'onlydelete-word)
(defun onlydelete-word (arg)
  "Kill characters forward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (save-excursion
    (let ((end (progn (unless (looking-back "\\>" 1) (forward-word 1)) (point)))
          (beg (progn (forward-word -1) (point))))
      (delete-region beg end)
      )))
;;ɾ����ǰ���� alt+p d
(global-set-key [(meta p)(d)] 'mydelete-current-word)
(defun mydelete-current-word ()
  (interactive)
  (save-excursion
    (let ((end (progn (unless (looking-back "\\>" 1) (forward-word 1)) (point)))
          (beg (progn (forward-word -1) (point))))
      (kill-region beg end)
      )))
;;���Ƶ�ǰ��  alt+p w
(global-set-key [(meta p)(w)] 'mycopy-current-word)
(defun mycopy-current-word ()
  (interactive)
  (save-excursion
    (let ((end (progn (unless (looking-back "\\>" 1) (forward-word 1)) (point)))
          (beg (progn (forward-word -1) (point))))
      (copy-region-as-kill beg end)
      (message "[copy]%s" (substring-no-properties (current-kill 0))))))

;;���Ƶ�ǰ�� alt+p l
(global-set-key [(meta p)(l)] 'push-line)
(defun push-line ()
  "Select current line, push onto kill ring."
  (interactive)
  (save-excursion
    (copy-region-as-kill (re-search-backward "^") (re-search-forward "$"))
    (message "[copy]%s" (substring-no-properties (current-kill 0)))
    )
)
;;----------------------------------------------------------------------------
;;���뵱ǰʱ�� alt+p i
(global-set-key [(meta p)(i)] 'my-insert-time)
(defun my-insert-time()
  (interactive)
  (insert (format-time-string "<%Y-%m-%d %H:%M>" (current-time)))
  (insert "\n")
  )
;;----------------------------------------------------------------------------
;;�����ַ���:*** useful link
(global-set-key [(meta p)(u)] 'useful4orgmode)
(defun useful4orgmode()
  (interactive)
  (move-beginning-of-line nil)
  (next-line)
  (insert "*** useful link\n")
  )
;;�����ַ���:*** basic use
(global-set-key [(meta p)(b)] 'basicuse4orgmode)
(defun basicuse4orgmode()
  (interactive)
  (next-line)
  (move-beginning-of-line nil)
  (insert "*** basic use\n")
  )
;;----------------------------------------------------------------------------
;;�����ַ���: ------------------------------- spliter -------------------------------
(global-set-key [(meta p)(s)] 'my-insert-spliter)
(defun my-insert-spliter()
  (interactive)
  (move-beginning-of-line nil)
  (insert "------------------------------- spliter -------------------------------\n")
  )
;;----------------------------------------------------------------------------
;;��.emacs(_emacs)�����ļ���������´��롣��alt+p k���Ϳ��Թرճ���ǰbuffer�����������buffer
(defun kill-other-buffers (&optional arg)
  (interactive "P")
  (setq curbuf (buffer-name))
  (setq buflist (mapcar (function buffer-name) (buffer-list)))
  (while buflist
    (setq buf (first buflist))
    (setq buflist (rest buflist))
    (if (string= curbuf buf) nil (kill-buffer buf))
    )
  )
(global-set-keppy [(meta p)(k)] 'kill-other-buffers)
;;----------------------------------------------------------------------------
(define-key global-map  (kbd "M-p <return>")   'view-mode)
;;���ļ�ʱ,�������ļ���,������ʹ��view-modeģʽ
;;(add-hook 'find-file-hook  'open-view-mode)
(defun open-view-mode()
  (interactive)
  (setq except-files '("jason-todo.org" ".bbdb" "tmp.txt"))
  (if (not (member (buffer-name) except-files))
      (progn
       (message "view-mode-enable")
       (view-mode-enable)
      )
  )
)
;;----------------------------------------------------------------------------
;;��.h�ļ���.cpp�ļ�֮���л�
;;��.h��.cpp�ļ�֮���л�
(defun switch-head2source-file ()
  "if current file is a header file, then open the
   corresponding source file or vice versa.
"
   (interactive)
  (let ((f (buffer-file-name))
        (headers '("h" "hpp" "hxx"))
        (sources '("c" "cxx" "cpp" "cc")))
    (if f
        (let* ((b (file-name-sans-extension f))
               (x (file-name-extension f))
               (s (cond
                   ((member x headers) sources)
                   ((member x sources) headers)
                   (t nil)))
               (return-value nil))
          (while s
            (let ((try-file (concat b "." (car s))))
              (cond
               ((find-buffer-visiting try-file)
                (switch-to-buffer (find-buffer-visiting
                                   try-file))
                (setq s nil
                      return-value t))
               ((file-readable-p try-file)
                (find-file try-file)
                (setq s nil
                      return-value t))
               (t (setq s (cdr s))))))
          return-value))))
;;----------------------------------------------------------------------------
(global-set-key [(meta p)(c)] 'count-region)
(defun count-region-1 (beginning end)
  (save-excursion
    (let ((count 0))
      (goto-char beginning)
      (while (and (< (point) end)
                  (re-search-forward "\\w+\\W*" end t))
        (setq count (1+ count))
        )
      (if (> beginning end)
          (setq char-count (- beginning end))
        (setq char-count (- end beginning))
        )
      (cond ((zerop count)
             (message
              "The region has 0 words, %d characters." char-count))
            ((= 1 count)
             (message
              "The region has 1 words, %d characters." char-count))
            (t
             (message
              "The region has %d words, %d characters." count char-count)))))
  )
;; prints number of words and characters in the region
(defun count-region ()
  (interactive)
  (if (and mark-active transient-mark-mode)
      (count-region-1 (region-beginning) (region-end));;the mark is activate
    (count-region-1(point-min) (point-max))
    )
  )
;;----------------------------------------------------------------------------
(defun filebat ()
   (interactive)
   (find-file "~/myemacs/data/filebat.txt")
 )
(defun bank ()
   (interactive)
   (find-file "~/myemacs/data/filebat.ledger")
 )
(defun gtd ()
   (interactive)
   (find-file "~/myemacs/data/jason-todo.org")
 )
(defun tmp ()
   (interactive)
   (find-file "~/myemacs/data/tmp.txt")
 )
;;----------------------------------------------------------------------------
;; removes duplicate lines in a buffer
(defun remove-duplicate-lines ()
  (interactive)
  (let ((llist nil) (cplist nil) (klist nil) (done) (mark 1))
    (save-excursion
      (beginning-of-buffer)
      (while (not (eobp))
	(progn
	  (setq line (buffer-substring (save-excursion 
					 (beginning-of-line) (point))
				       (save-excursion (end-of-line) (point))))
	  (setq cplist llist)
	  (setq done t)
	  (while (and cplist done)
	    (if (and (not (equal line "")) 
		     (equal line (car cplist)) 
		     (not (equal line "#endif")))
		(progn
		  (setq klist (cons mark klist))
		  (setq done nil)))
	    (setq cplist (cdr cplist)))
	  (if done (setq llist (cons line llist)))
	  (forward-line 1)
	  (setq mark (+ mark 1)))))
    (save-excursion
      (beginning-of-buffer)
      (while klist
	(progn
	  (goto-line (car klist))
	  (kill-line 1))
	(setq klist (cdr klist)))))
  (save-buffer (current-buffer))) 
;;----------------------------------------------------------------------------
(define-key global-map  (kbd "M-p SPC") 'guettler-push-region)
(define-key global-map  (kbd "M-p <backspace>") 'guettler-pull-region)
;;shift region right
(defun guettler-push-region (beg en)
  (interactive "r")
  (guettler-move-region beg en 1))
;;shift region left
(defun guettler-pull-region (beg en)
  (interactive "r")
  (guettler-move-region beg en -1))
(defun guettler-move-region (beg en dir)
  (indent-rigidly beg en dir)   
  ;; this line is very important. makes the region mark sticky
  (setq deactivate-mark nil)    
  (push-mark beg t t))
;;----------------------------------------------------------------------------
(display-time)
(add-hook 'diary-hook 'appt-make-list)
(diary 0)
(setq calendar-week-start-day 1)
;;----------------------------------------------------------------------------
;;regexp query and replace
(defalias 'qrr 'query-replace-regexp)
;;----------------------------------------------------------------------------
;;query before flush lines
(defalias 'qfl 'query-flush-lines)
(defun query-flush-lines (regexp &optional rstart rend interactive)
  "Similar to flush-lines, but queries before flushing."
  (interactive
   (progn
     (barf-if-buffer-read-only)
     (keep-lines-read-args "Flush lines (containing match for regexp): ")))
  (if rstart
      (progn
	(goto-char (min rstart rend))
	(setq rend (copy-marker (max rstart rend))))
    (if (and interactive transient-mark-mode mark-active)
	(setq rstart (region-beginning)
	      rend (copy-marker (region-end)))
      (setq rstart (point)
	    rend (point-max-marker)))
    (goto-char rstart))
  (let ((case-fold-search (and case-fold-search
			       (isearch-no-upper-case-p regexp t))))
    (save-excursion
      (while (and (< (point) rend)
		  (re-search-forward regexp rend t))
		(if (y-or-n-p "Flush? ")
			(progn
			  (delete-region (save-excursion (goto-char (match-beginning 0))
											 (forward-line 0)
										   (point))
							 (progn (forward-line 1) (point))))))))
  (set-marker rend nil)		
  nil)
;;----------------------------------------------------------------------------
