# album leaf

Regain control of your photo library

![](one_day.jpg)
_one day my photos will be on time_

If you use a cloud photo host like iCloud and you have decades of photos you eventually hit the point of paranoia where you can't just outsource the ownership of all those memories for safe keeping. Especially when you're merging multiple libraries and photos from people's devices. This humble script reads in EXIF data from JPEG (and hopefully RAW formats soon) to re-sort photos into directories based on the date the photo was taken. If you're lucky, all your early 2000s digital cameras had the clock set correctly, but if not you'll get some false positives.

This worked well for me in a library of 30,000+ photos. YMMV. Use at your own risk.

Limitations? Probably tons. Currently doesn't work well or at all with RAW photos (HEIC, DNG, RAW). Will leave those files in place in the source directory. Doesn't do anything with video files you may have co-mingled into your photo library. This does nothing with your iCloud Photo albums or anything. The end result is a directory for every day of photos you've taken. Directory globbing needs some work (`*/*/*`). This is something that always trips me up, I'll figure this out eventually.

Why `album leaf`? Great band. Almost called it `album leave` as in exodus from cloud managed albums but that was too cutesy. This name will do.

## Use

* Back up your photo library in case something goes wrong. 
* Drop the script into the directory where you have photos you want to re-sort by date. 
* `ruby album_leaf.rb`
