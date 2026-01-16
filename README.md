These ebuilds have close to no difference to those found in the main Gentoo
repository, aside for a couple of nudges here and there. If the main repo
were to change in accord, these ebuilds will be deleted. In particular:

- sys-apps/portage: the dependency on getuto is changed from mandatory to
  optional, with the addition of a dedicated flag. There is actually an open
  bug report concerning this (https://bugs.gentoo.org/919359).
- dev-lang/R: removed a dependency on ghostscript. According to
  https://cran.r-project.org/doc/manuals/r-patched/R-admin.html,
  ghostscript is "desireable" but not mandatory: to generate pdf
  plots, you only need cairo. Maybe because it's automagic
  (https://wiki.gentoo.org/wiki/Project:Quality_Assurance/Automagic_dependencies)
  or because it's a runtime dependency. Also filters LTO (R handles
  LTO on its own).
- x11-misc/compose-tables: added a patch that drops the dependency on X. This has
  been referenced in a bug report (https://bugs.gentoo.org/849770), but will not
  be implemented (and rightfully so) because it should be dealt with by upstream
  (https://gitlab.freedesktop.org/xorg/lib/libx11/-/issues/122).
- sci-biology/biopython: much more packages in the main repo are marked as
  dependencies, but https://biopython.org/wiki/Download marks them as optional.

Other ideas:

- media-gfx/graphviz: libgd could be disabled.
- app-arch/libarchive: libarchive optionally depends on openssl, but in the main
  repo is enforced;
- www-client/lynx: dired is optional;
- app-text/xournalpp: many, many more flags should be introduced.

Also, many multimedia libraries expose a 'tools' configure option of sort that in
the main repo is absent.
