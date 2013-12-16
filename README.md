![Gif showing editing layout constants results in real time layout updates](/images/ClassyLiveLayout1.gif)

Suplementary blogpost: http://codeblog.shape.dk/blog/2013/12/16/live-editing-layout-constants-using-classy/

This repository (and pod available through Cocoapods) contains the category `UIView+ClassyLayoutProperties` making it easy to define size and margin properties on views that can be set from a [Classy](http://classy.as) stylesheet and trigger `-updateConstraints` that can then easily be implemented using [Masonry](https://github.com/cloudkite/Masonry)'s `mas_updateConstraints:`.
