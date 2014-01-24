A collection of unix config files - useful to have around when working frequently on different computers etc.

If you (for some reason) want to clone this repository, use ```--recursive``` as most vim plugins
are stored as submodules.

oh-my-zsh isn't included as a submodule; it'll need to be cloned seperately due to
being unable to add a submodule and then other submodules inside it (e.g. plugins inside
the oh-my-zsh submodule).. The oh-my-zsh-plugins directory should
then be symlinked to ~/.oh-my-zsh/custom/plugins
