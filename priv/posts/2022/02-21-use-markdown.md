%{
title: "Markdown! (Not a sales pitch)",
author: "lonesome-coder",
tags: ~w(markdown tag2),
description: "Markdown is the simplest format to use to add content to a website. There are a couple of tools that are needed to use Markdown files in a React project...",
}
---

![markdown logo](https://i.ibb.co/2Sq1PD9/markdown-mark.png)

One of the first topics I researched when building the blog was how to create the blog posts. Writing HTML or JSX is clumsy, and I like simple.

It became clear that Markdown was the way to go. It's used in writing _readme.md_ files that you store with your repositories. There are special characters that are used to format Markdown, but they are easier to type than tags. [Here](https://commonmark.org/help/) is a cheatsheet to help you get started.

## Formatting a Markdown File

For each post, I write a _\*.md_ file. What's great about this is that code editors like VS Code let you open a view that shows what the rendered content looks like.

A trick I picked up is to add metadata to the files. Put _---_ on the first line, and anything entered until the next line with _---_ is interpreted as metadata by the _parse\-.md_ package (see [npm parse\_.md](https://www.npmjs.com/package/parse-md)). Here's an example:

```js
---
postUid: postUid1
postId: 1
title: Post Title
slug: slugified-post-title
date:  April 1, 2021
author: Whoever
summary: Write an attention-getting summary here...
keywords: markdown parse-md react-markdown firestore
filename: filename.md
imageName: []
imageUrl: []
---
## Start the Content Here
...
```

The _title_, _date_, _author_ and _filename_ lines are standard metadata. The _postId_ is used to sort an array of all the posts in descending order so the most recent post is at the top. The _keywords_ are used to search for posts from the entire list. I'll explain _postUid_, _imageName_ and _imageUrl_ when I get into the code in a future post.

This format is known a _YAML Front Matter_. There seem to be some advanced packages for working with it, but _parse\-.md_ is simple, and that's where I'm at now.

## Markdown to JSX

After a Markdown file is read into the React code, it needs to be converted to JSX so it can be rendered. There are several packages that do this, including [_remark_](https://www.npmjs.com/package/marked) and [_markdown-to-jsx_](https://www.npmjs.com/package/markdown-to-jsx), among others.

I'm using [_react-markdown_](https://www.npmjs.com/package/react-markdown) because, as is usual for me, it's pretty easy to use. It's also popular and well documented, good signs that it is actively supported.

What it does is create a custom React component the you wrap the Markdown content in. It translates the Markdown formatting to JSX. For example, a top Markdown heading (#) is translated to a `<h1>` tag, or a paragraph of text is wrapped in a `<p>` tag. You can add your own styling from there.

Creating content in Markdown speeds up the process. Since it is rendered in common HTML tags, styling is straightforward. Yep, it's the way to go.
