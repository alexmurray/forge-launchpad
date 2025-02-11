;;; forge-launchpad.el --- Launchpad support  -*- lexical-binding:t -*-

;;; Commentary:

;; Copyright (C) 2022 Alex Murray

;; Author: Alex Murray <alex.murray@canonical.com>
;; Maintainer: Alex Murray <alex.murray@canonical.com>

;; SPDX-License-Identifier: GPL-3.0-or-later

;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation, either version 3 of the License,
;; or (at your option) any later version.
;;
;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this file.  If not, see <https://www.gnu.org/licenses/>.

;;; Code:

(require 'forge)
(require 'cl)

;;; Class

(defclass forge-launchpad-repository (forge-noapi-repository)
  ((commit-url-format :initform "https://%h/~%p/commit/?id=%r")
   (branch-url-format :initform "https://%h/~%p/log/?h=%r")
   (remote-url-format :initform "https://%h/~%p/")
   (blob-url-format   :initform "https://%h/~%p/tree/%f?id=%r"))
  "Launchpad from https://help.launchpad.net/Code/Git.")

(add-to-list 'forge-alist '("git.launchpad.net" nil
                            "git.launchpad.net" forge-launchpad-repository))

(provide 'forge-launchpad)
;;; forge-launchpad.el ends here
