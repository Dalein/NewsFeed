
#NewsFeed
Simple rss reader app. Example of MVVM architecture in iOS programming.


#Usage
On top level all you need to do is:

```objectivec
NewsFetchImpl *fetchImp = [NewsFetchImpl new];
_viewModel = [[NewsFetchViewModel alloc] initWithServices:fetchImp];
_viewModel.arrSources = @[[NSURL URLWithString:@"https://lenta.ru/rss"],
[NSURL URLWithString:@"http://www.gazeta.ru/export/rss/lenta.xml"]];
```
ReactiveCocoa is using to notify the viewModel.


# License 
Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 of the Software, and to permit persons to whom the Software is furnished to do
 so, subject to the following conditions:

 If you happen to meet one of the copyright holders in a bar you are obligated
 to buy them one pint of beer.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
