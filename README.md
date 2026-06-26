I couldn't find sdl3-gfx anywhere so I've put it here. It's a poorly-cooked
ebuild but it works.

The remaining ebuilds have close to no difference to those found in the main
Gentoo repository, aside for a couple of nudges here and there. If the main
repo were to change in accord, these ebuilds will be deleted. In particular:

- sys-apps/portage: the dependency on getuto is changed from mandatory
  to optional, with the addition of a dedicated flag. There is actually
  an open bug report concerning this (https://bugs.gentoo.org/919359).
- x11-misc/compose-tables: added a patch that drops the dependency on X.
  This has been referenced in a bug report (https://bugs.gentoo.org/849770),
  but will not be implemented (and rightfully so) because it should be dealt
  with by upstream
  (https://gitlab.freedesktop.org/xorg/lib/libx11/-/issues/122).
- app-text/xournalpp: turned many hardwired dependencies into optional
  components. Also, preventing man pages compression with a patch is no
  longer necessary (A directive instructs CMake to do so).
- net-libs/glib-networking: allows one to choose between OpenSSL and GnuTLS,
  instead of enforcing the latter. The ebuild in the main repo forbids this
  choice because the OpenSSL backend is considered unreliable by upstream
  (https://bugs.gentoo.org/827206).

Other ideas:

- media-gfx/graphviz: libgd could be disabled, only allowing vector formats.
  However, packages that use Graphviz for testing could very well expect it
  to (also) support raster formats. Saves a dependency but probably not worth
  it.
- app-arch/libarchive: has an optional dependency on OpenSSL which in the main
  repo is enforced. Mostly irrelevant.
- www-client/lynx: dired is optional. Definitely irrelevant.
- Many multimedia libraries expose a 'tools' configure option of sort that in
  the main repo is absent. Only of interest from a disk space standpoint.
