![Gif showing editing layout constants results in real time layout updates](/images/ClassyLiveLayout1.gif)

Iterate blazingly fast when defining view layouts by putting your AutoLayout constants in a stylesheet file with live reloading. No need to recompile and restart the simulator when you change a constant.

Suplementary blogpost: http://codeblog.shape.dk/blog/2013/12/16/live-editing-layout-constants-using-classy/

This repository (and pod available through Cocoapods) contains the category `UIView+ClassyLayoutProperties` making it easy to define size and margin properties on views that can be set from a [Classy](http://classy.as) stylesheet and trigger `-updateConstraints` that can then easily be implemented using [Masonry](https://github.com/cloudkite/Masonry)'s `mas_updateConstraints:`. This pod also contains a number of convenient methods making it easy and declarative to define layouts with constants taken from the stylesheet.


In your view's -updateConstraints method you define a layout like this:
``` obj-c
// new shorthand notation to create constrains relative to the superview with constants from stylesheet
[_blueBoxView mas_updateConstraintsWidthFromStylesheet];
[_blueBoxView mas_updateConstraintsHeightFromStylesheet];
[_blueBoxView mas_updateConstraintsWithTopMarginRelativeToSuperview];
// or we can specify another view to set margins relative to:
[_blueBoxView mas_updateConstraintsWithLeftMarginRelativeTo:self];
```

In the stylesheet we set the constants implicitly referenced in the above layout code.
```
UIView.blue-box {
    background-color: blue;
    size: 120 80;
    margin-top: 110;
    margin-left: 50;
}
```

If you have set up live reloading in [Classy](http://classy.as) the view will immediately update when you change the size and margin in the stylesheet. The best way to get started is to check out the demo project included in this repo.

There is also an example of how to use this with UITableViewCells and an abstract UICollectionView class that can be used to easily get this behavior in collection views.