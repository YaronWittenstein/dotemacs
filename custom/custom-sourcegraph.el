(defun github-to-sourcegraph ()
  "Substitutes GitHub repositories links with the SourceGraph corresponding links"
  (interactive)
  (sourcegraph--substitute "https://github.com/" "https://sourcegraph.com/github.com/"))

(defun sourcegraph-to-github ()
  "Substitutes SourceGraph repositories links with the GitHub corresponding links"
  (interactive)
  (sourcegraph--substitute "https://sourcegraph.com/github.com/" "https://github.com/"))

(defun sourcegraph--substitute (src dst)
  (save-excursion
    (save-restriction
      (save-match-data
        (widen)
        (push-mark)
        (goto-char (point-min))
        (while (search-forward src nil t)
          (let ((end (point))
                (start (- (point) (length src))))
                (delete-region start end)
                (insert dst)))))))

(provide 'custom-sourcegraph)
