#!/usr/bin/env python3

import re

async def generate(hub, **pkginfo):
	github_user = "dcnieho"
	github_repo = "FreeGLUT"
	tag_data = await hub.pkgtools.fetch.get_page(
		f"https://api.github.com/repos/{github_user}/{github_repo}/tags", is_json=True
	)
	for tag in tag_data:
		match = re.match("v([0-9.]+)", tag["name"])
		if not match:
			continue
		version = match.groups()[0]
		tarball_url = tag["tarball_url"]
		commit_sha = tag["commit"]["sha"]
		break
	ebuild = hub.pkgtools.ebuild.BreezyBuild(
		**pkginfo,
		version=version,
		github_user=github_user,
		github_repo=github_repo,
		commit_sha=commit_sha,
		artifacts=[
			hub.pkgtools.ebuild.Artifact(
				url=tarball_url,
				final_name=f"{pkginfo['name']}-{commit_sha}.tar.gz",
			)
		],
	)
	ebuild.push()


# vim: ts=4 sw=4 noet
