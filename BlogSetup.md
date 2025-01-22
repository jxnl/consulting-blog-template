# Blog setup walkthrough with mkdocs and github.io

Capture your client's attention with a spiffy personal blog based on mkdocs and a material theme. We'll walk through forking & modifying Jason's consulting-blog-template for a **free** github.io hosted website.

## Get Jason's consulting blog template

- **Assumptions** - The following are assumed (obviously the general flow will also work for Linux, MacOS, etc. though some commands will differ):
	- Win11 
	- Anaconda for Python environments and command terminals
	- Git Desktop/Git Bash or similar installed 
	- local repos in ```%USERPROFILE%\github\``` directory
	- a Github account
	- your repo to be named 'blog'

- **Get the repo**
	- Fork: https://github.com/jxnl/consulting-blog-template to your own github account, renaming it to the shorter 'blog'
	- Clone local copy to ```%USERPROFILE%\github\blog```

- **Setup a website**
	- Create a username.github.io site (using your 'username'): 
		- https://pages.github.com/
	- Clone local copy to ```%USERPROFILE%\github\username.github.io``` 

- **Create a Python environment**
	
	```
	cd %USERPROFILE%\github\blog
	conda create blog
	conda activate blog
	pip install -r requirements-doc.txt
	mkdocs build
	```
	If it all works, you can skip the next subsection.

- **Fix the mkdocs-material environment for Win11**
	- If mkdocs-material[imaging] fails (e.g. on mkdocs build), you may have to:
	- Read: https://squidfunk.github.io/mkdocs-material/plugins/requirements/image-processing/#cairo-graphics-windows
	- Install MSYS2: https://www.msys2.org/
	- Install Cairo Graphics:
	
	```
	pacman -S mingw-w64-ucrt-x86_64-cairo
	```

	- [ ] Ensure that the mkdocs build step works before proceeding!
		- Check path variables if neccesary

## Content Updates to make to go-live: 
- mkdocs.yml
	- update the following fields:
	- [ ] site_name: 'your name' 
	- [ ] site_author: 'your name' 
	- [ ] site_description: 'your name +/- desc'
	- [ ] repo_name: 'the github repo name (that holds your blog) - "blog" recommended'
	- [ ] repo_url: 'the github repo url (that holds your blog)
	- [ ] site_url: 'e.g. https://username.github.io/' (you can change this later after your custom domain is setup)
	- [ ] copyright: 'your name/LLC' 
	- social:
		- [ ] optionally add LinkedIn (or other socials)
			- icon: 'fontawesome/brands/linkedin'
			- link: 'update your LinkedIn link'
		- [ ] link: 'update your twitter link'
		- [ ] link: 'update your github link'
- docs/index.md
	- [ ] update 'challenges' bullet points
	- [ ] add your recent 'client success stories' to the table (or provide other proof)
	- [ ] update 'help' text and bullet points
	- [ ] setup cal.com acct or similar
	- [ ] update [Schedule a Consultation] button URL with your scheduler link
- docs/blog/index.md
	- [ ] customize 'insights' bullet points
	- [ ] add a featured post with markdown as below, with seperate sections for key posts using markdown 
		```
		## New Section   
		[Example Blag Post](./posts/example.md): What's next for Example?
		```
	- [ ] update "Subscribe to Updates" url for your newsletter (or remove this subsection)
		- [ ] Setup convertkit account at kit.com (or beehiiv.com, podia.com, etc.)
		- [ ] update the url to your subscribe link
		- [ ] add ```{ .md-button .md-button--primary }``` directly after (url), no space, to make link into primary button
- docs/blog/.authors.yml 
	- [ ] update "name" with your name
	- [ ] update "avatar" with your github picture - find your github profile pic, right click & select 'copy image address' to get url
	- [ ] update "url" with your twitter handle
- docs/blog/posts/
	- [ ] add at least one post (then link it as a featured post)
	- [ ] you can delete example.md post (it is useful as an example)
	- [ ] you can delete this post, mkdocsblog.md if it exists (or keep around until things settle)
- docs/
	- [ ] you can delete writing-samples.md (it is useful as an example)

## Blog Publishing 

- **Run Locally**: Start a local server to preview your site.
   ```
   conda activate blog
   cd %USERPROFILE%\github\blog
   mkdocs serve -w .
   ```

- **Iterate Content**
	- edit files in the blog repo under 'docs' folder (and mkdoc.yml) using Cursor, Visual Studio Code, etc.
	- serve locally 
		```
		mkdocs serve -w .
		``` 
	- view on local browser e.g. http://127.0.0.1:8000/
	- often saving a .md file will auto-refresh the site
	- on error: 
		- hit CTRL-C in the Anaconda prompt window, then
		- serve locally again 
		```
		mkdocs serve -w .
		``` 

- **Save Blog**
	- Check changes & add new files per usual ```git status```, ```git add .``` etc.
	- Commit changes to your local blog repo ```git commit -m "my blog updates"```
	- Optional: Push blog markdown to github.com: ```git push origin```

- **Publish Blog**
	- Reference: https://www.mkdocs.org/user-guide/deploying-your-docs/#organization-and-user-pages
	- Go to your username.github.io local repo: 

		```
		cd %USERPROFILE%\github\username.github.io
		```

	- Deploy (targeting main branch): 

		```
		mkdocs gh-deploy --config-file ..\blog\mkdocs.yml --remote-branch main
		```
	- Review, iterate as needed

## Setup Custom URL

- **Custom URL Setup (one time)**
	- By default, your blog/website will be at https://username.github.io, but you can easily give it a custom URL
	- [ ] Buy a domain of your choice: e.g. 'yourdomain.com'
	- Reference: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site
		- [ ] Goto your username.github.io site to Configure DNS, Verify the Domain, and Enable the Custom domain on your site. For github.io specifically:
			- No wildcards!
			- Ensure verification is complete even if you have to wait 24h!
		- [ ] Setup 'A' records to point your domain to github.io (see reference above)
		
		| Host | Type | Priority | Data |
		|------|------|----------| -----|
		| @ | A | — | 185.199.108.153 |
		| @ | A | — | 185.199.109.153 |
		| @ | A | — | 185.199.110.153 |
		| @ | A | — | 185.199.111.153 |

		- [ ] Setup a CNAME record to point your domain to github.io, e.g.

		| Host | Type | Priority | Data |
		|------|------|----------| -----|
		| www | CNAME | — | username.github.io |

		- Note: I found that while the A records took effect very quickly, I had to wait some time before the CNAME record kicked in.

		- [ ] Add a 'CNAME' text file to the blog 'docs' folder with 'yourdomain.com' as only text (no quotes)
			- a CNAME file may get added by github when you do the DNS config above, if so you can just 'git pull origin' or similar to merge in to your local repo

	- [ ] Edit mkdocs.yml, "site_url" property and replace https://username.github.io with https://yourdomain.com
		- this is needed to fixup your sitemap.xml
		- you will need to republish the site per Blog Publishing above
	- After the site is fully up, you can review it at https://search.google.com/search-console
		- [ ] Verify Sitemaps page (https://search.google.com/search-console/sitemaps) includes your sitemap: 
		https://yourdomain.com/sitemap.xml
		- [ ] Ensure your blog page(s) are indexed: https://search.google.com/search-console/index (request indexing and return later if needed)
		- Once a blog entry is indexed (and considered the canonical source), you can consider cross posting it (or part of it) to Medium, LinkedIn, X, BlueSky etc.

## Conclusion

You should now have a working personal blog based on mkdocs and a material theme. It's free, writtten in Markdown and publishable via standard git & mkdocs terminal commands. Time to get busy revising the content.

## Note
Walkthrough is based on a blog post written after implementing the blog template: https://fergusonanalytics.com/blog/2024/12/20/personal-blog-with-mkdocs-and-githubio/