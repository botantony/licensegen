return {
	-- config errors
	["error-template"] = "$red$Error$reset$: $error$",
	["config-unsupported-key"] = "key `$key$` uses unsupported type $type$ (use number or string)!",
	["config-unsupported-value"] = "value `$value$` uses unsupported type $type$ (use number or string)!",
	-- invalid aliases
	["error-invalid-alias-key"] = "invalid alias key `$key$` with value `$value$!",
	["error-invalid-alias-value"] = "invalid alias value `$value$` with key `$key$`!",
	["error-invalid-alias-string-type"] = "Key and value must be strings!",
	-- overlapping licenses
	["warning-template"] = "$yellow$Warning$reset$: $warning$",
	["warning-overlapping-licenses"] = "because names of the licenses are case-insensitive, these $type$ licenses are overlapping: $first$ and $second",
	["license-type-custom"] = "custom",
	["license-type-standard"] = "standard",
	-- license list
	["license-list-custom-licenses"] = "Custom licenses:",
	["license-list-overwrites"] = "$license$ (overwrites standard license)",
	["license-list-overwritten"] = "$license$ (overwritten by custom license)",
	["license-list-standard-licenses"] = "Standard licenses:",
	-- help
	["cli-help"] = [==[Small tool for generating license files
USAGE:

	licensegen [OPTIONS] [LICENSE] [ARGUMENTS]

OPTIONS:

	-h,     --help        Show this help
	-v,     --version     Show program version
	-a,     --aliases     Show aliases
	-i,     --info        Show detailed info about the specific license
	--list, --licenses    List all licenses
	--cfg,  --config      Show config directory

ARGUMENTS:

Replace arguments must be set in the following format: `--<arg>=<text>`, f.e. `--owner=username` or `--owner="Your Full Name"`. All arguments (with some exceptions) can be set in config and overwritten by CLI parameters.

There are some specific arguments that may be set automatically:
	aliases       Sets aliases for licenses (table, check `--aliases` for the full list)
	filename      Name of the output file (`LICENSE` by default)
	licensename   License type you want to use (only for config file)
	owner         Owner of the project (name of the current user by default)
	project       Name of the project (name of the current directory by default)
	workdir       Full path to the project
	year          Current year

List of arguments that are reserved:]==],
	["cli-help-cfg-only"] = "These arguments can be set only via config file:",
	["cli-aliases"] = "List of all aliases to different licenses. You can set your own aliases or rewrite existing ones in config file:",
	-- config path
	["cli-config-directory"] = [==[Full path to the config directory: $dir$$slash$
Config file: $dir$$slash$config.lua
Directory with custom licenses: $dir$$slash$licenses$slash$]==],
	["error-unknown-license"] = "unknown license `$name$`. Maybe you were looking for a different license with similar name:",
	["error-no-license-name"] = "no license name was provided!",
	["warning-unfilled-argument"] = "argument `$arg$` was not replaced!",
	["error-open-file"] = "An error occured during opening file `$path$`!",
	-- note formatting
	["note-format"] = "$blue$Note$reset$: $note$",
	-- done
	["done"] = "$green$DONE!$reset$",
	-- notes
	["note-agpl-3.0"] = "The Free Software Foundation recommends taking the additional step of adding a boilerplate notice to the top of each file. The boilerplate can be found at the end of the license.",
	["note-apache-2.0"] = "The Apache Software Foundation recommends taking the additional step of adding a boilerplate notice to the header of each source file. You can find the notice in the appendix at the very end of the license text. See more information here: https://apache.org/foundation/license-faq.html#Apply-My-Software",
	["note-bsl-1.0"] = "Boost recommends taking the additional step of adding a boilerplate notice to the top of each file. The boilerplate can be found at the Boost Software License FAQ: https://www.boost.org/users/license.html#FAQ",
	["note-cc0-1.0"] = "Creative Commons recommends taking the additional step of adding a boilerplate notice to the top of each file. The boilerplate can be found on their website: https://wiki.creativecommons.org/wiki/CC0_FAQ#May_I_apply_CC0_to_computer_software.3F_If_so.2C_is_there_a_recommended_implementation.3F",
	["note-cern-ohl-p-2.0"] = "CERN recommends adding the following information in the source files: copyright and license notice, a disclaimer of warranties and a source location. You can also include the source location in a part of the design which will be visible in the end product: https://ohwr.org/project/cernohl/wikis/uploads/8a6b5d01f71c207c49493e4d114d61e6/cern_ohl_p_v2_howto.pdf",
	["note-cern-ohl-s-2.0"] = "CERN recommends adding the following information in the source files: copyright and license notice, a disclaimer of warranties and a source location. You can also include the source location in a part of the design which will be visible in the end product: https://ohwr.org/project/cernohl/wikis/uploads/cf37727497ca2b5295a7ab83a40fcf5a/cern_ohl_s_v2_user_guide.pdf",
	["note-cern-ohl-w-2.0"] = "CERN recommends adding the following information in the source files: copyright and license notice, a disclaimer of warranties and a source location. You can also include the source location in a part of the design which will be visible in the end product: https://ohwr.org/project/cernohl/wikis/uploads/c2e5e9d297949b5c2d324a6cbf6adda0/cern_ohl_w_v2_howto.pdf",
	["note-ecl-2.0"] = "The Apereo Foundation recommends taking the additional step of adding a boilerplate notice to the header of each source file. You can find the notice in the appendix at the very end of the license text.",
	["note-eupl-1.1"] = "The European Commission recommends taking the additional step of adding a boilerplate notice to the top of each file: https://joinup.ec.europa.eu/sites/default/files/inline-files/EUPL%201_1%20Guidelines%20EN%20Joinup.pdf#page=17",
	["note-gfdl-1.3"] = 'The Free Software Foundation recommends taking the additional step of adding a boilerplate notice after the title of a licensed document. The boilerplate can be found at the "addendum" part of the license.',
	["note-gpl-2.0"] = "The Free Software Foundation recommends taking the additional step of adding a boilerplate notice to the top of each file. The boilerplate can be found at the end of the license.",
	["note-gpl-3.0"] = "The Free Software Foundation recommends taking the additional step of adding a boilerplate notice to the top of each file. The boilerplate can be found at the end of the license.",
	["note-lgpl-2.1"] = "The Free Software Foundation recommends taking the additional step of adding a boilerplate notice to the top of each file. The boilerplate can be found at the end of the license.",
	["note-lgpl-3.0"] = "The Free Software Foundation recommends taking the additional step of adding a boilerplate notice to the top of each file. The boilerplate can be found at the end of the license.",
	["note-lpp-1.3c"] = "An example boilerplate and more information about how to use the license can be found at the end of the license.",
	["note-mpl-2.0"] = "The Mozilla Foundation recommends taking the additional step of adding a boilerplate notice to the top of each file. The boilerplate can be found at the end of the license (Exhibit A).",
	["note-mulanpsl-2.0"] = "It's suggested to take the additional step of adding a boilerplate notice to the top of each file. The boilerplate can be found at the end of the license.",
	["note-ofl-1.1"] = "This license doesn't require source provision, but recommends it. All files derived from OFL files must remain licensed under the OFL.",
	["note-upl-1.0"] = "It is recommended to add a link to the license and copyright notice at the top of each source file, example text can be found at https://oss.oracle.com/licenses/upl/",
	-- descriptions
	["description-0bsd"] = "The BSD Zero Clause license goes further than the BSD 2-Clause license to allow you unlimited freedom with the software without requirements to include the copyright notice, license text, or disclaimer in either source or binary forms.",
	["description-afl-3.0"] = "The Academic Free License is a variant of the Open Software License that does not require that the source code of derivative works be disclosed. It contains explicit copyright and patent grants and reserves trademark rights in the author.",
	["description-agpl-3.0"] = "Permissions of this strongest copyleft license are conditioned on making available complete source code of licensed works and modifications, which include larger works using a licensed work, under the same license. Copyright and license notices must be preserved. Contributors provide an express grant of patent rights. When a modified version is used to provide a service over a network, the complete source code of the modified version must be made available.",
	["description-apache-2.0"] = "A permissive license whose main conditions require preservation of copyright and license notices. Contributors provide an express grant of patent rights. Licensed works, modifications, and larger works may be distributed under different terms and without source code.",
	["description-artistic-2.0"] = "Heavily favored by the Perl community, the Artistic license requires that modified versions of the software do not prevent users from running the standard version.",
	["description-blueoak-1.0.0"] = "A permissive license whose main conditions require providing notice of the license. Contributors provide an express grant of patent rights. Licensed works, modifications, and larger works may be distributed under different terms and without source code.",
	["description-bsd-2-clause"] = "A permissive license that comes in two variants, the BSD 2-Clause and BSD 3-Clause. Both have very minute differences to the MIT license.",
	["description-bsd-2-clause-patent"] = "This license is designed to provide: a) a simple permissive license; b) that is compatible with the GNU GPL-2.0; and c) which also has an express patent grant included.",
	["description-bsd-3-clause"] = "A permissive license similar to the BSD 2-Clause License, but with a 3rd clause that prohibits others from using the name of the copyright holder or its contributors to promote derived products without written consent.",
	["description-bsd-3-clause-clear"] = "A variant of the BSD 3-Clause License that explicitly does not grant any patent rights.",
	["description-bsd-4-clause"] = 'A permissive license similar to the BSD 3-Clause License, but with an "advertising clause" that requires an acknowledgment of the original source in all advertising material.',
	["description-bsl-1.0"] = "A simple permissive license only requiring preservation of copyright and license notices for source (and not binary) distribution. Licensed works, modifications, and larger works may be distributed under different terms and without source code.",
	["description-cc-by-4.0"] = "Permits almost any use subject to providing credit and license notice. Frequently used for media assets and educational materials. The most common license for Open Access scientific publications. Not recommended for software.",
	["description-cc-by-sa-4.0"] = "Similar to CC-BY-4.0 but requires derivatives be distributed under the same or a similar, compatible license. Frequently used for media assets and educational materials. A previous version is the default license for Wikipedia and other Wikimedia projects. Not recommended for software.",
	["description-cc0-1.0"] = "The Creative Commons CC0 Public Domain Dedication waives copyright interest in a work you've created and dedicates it to the world-wide public domain. Use CC0 to opt out of copyright entirely and ensure your work has the widest reach. As with the Unlicense and typical software licenses, CC0 disclaims warranties. CC0 is very similar to the Unlicense.",
	["description-cecill-2.1"] = "Strong copyleft license made by three French public research organisations, CEA, CNRS, and Inria, compatible with AGPL-3.0, EUPL-1.1, and GPL-2.0, or later versions of those licenses.",
	["description-cern-ohl-p-2.0"] = "A permissive license for hardware designs, with conditions only requiring preservation of notices. Contributors provide an express grant of patent rights. Licensed works, modifications, and larger works may be distributed under different terms and without sources.",
	["description-cern-ohl-s-2.0"] = "Permissions of this strongly reciprocal license for hardware designs are conditioned on making available complete sources of licensed works and modifications, which include larger works using a licensed work, under the same license. Notices must be preserved. Contributors provide an express grant of patent rights.",
	["description-cern-ohl-w-2.0"] = "Permissions of this weakly-reciprocal license are conditioned on making available complete sources of licensed works and modifications under the same license. Notices must be preserved. Contributors provide an express grant of patent rights. However, a larger work using the licensed work through interfaces provided by the licensed work may be distributed under different terms and without sources for the larger work.",
	["description-ecl-2.0"] = 'The Educational Community License version 2.0 ("ECL") consists of the Apache 2.0 license, modified to change the scope of the patent grant in section 3 to be specific to the needs of the education communities using this license.',
	["description-epl-1.0"] = "This commercially-friendly copyleft license provides the ability to commercially license binaries; a modern royalty-free patent license grant; and the ability for linked works to use other licenses, including commercial ones.",
	["description-epl-2.0"] = "This commercially-friendly copyleft license provides the ability to commercially license binaries; a modern royalty-free patent license grant; and the ability for linked works to use other licenses, including commercial ones.",
	["description-eupl-1.1"] = "The “European Union Public Licence” (EUPL) is a copyleft free/open source software license created on the initiative of and approved by the European Commission in 22 official languages of the European Union.",
	["description-eupl-1.2"] = "The European Union Public Licence (EUPL) is a copyleft free/open source software license created on the initiative of and approved by the European Commission in 23 official languages of the European Union.",
	["description-gfdl-1.3"] = "A copyleft license for software documentation.",
	["description-gpl-2.0"] = "The GNU GPL is the most widely used free software license and has a strong copyleft requirement. When distributing derived works, the source code of the work must be made available under the same license. There are multiple variants of the GNU GPL, each with different requirements.",
	["description-gpl-3.0"] = "Permissions of this strong copyleft license are conditioned on making available complete source code of licensed works and modifications, which include larger works using a licensed work, under the same license. Copyright and license notices must be preserved. Contributors provide an express grant of patent rights.",
	["description-isc"] = "A permissive license lets people do anything with your code with proper attribution and without warranty. The ISC license is functionally equivalent to the BSD 2-Clause and MIT licenses, removing some language that is no longer necessary.",
	["description-lgpl-2.1"] = "Primarily used for software libraries, the GNU LGPL requires that derived works be licensed under the same license, but works that only link to it do not fall under this restriction. There are two commonly used versions of the GNU LGPL.",
	["description-lgpl-3.0"] = "Permissions of this copyleft license are conditioned on making available complete source code of licensed works and modifications under the same license or the GNU GPLv3. Copyright and license notices must be preserved. Contributors provide an express grant of patent rights. However, a larger work using the licensed work through interfaces provided by the licensed work may be distributed under different terms and without source code for the larger work.",
	["description-lppl-1.3c"] = "The LaTeX Project Public License (LPPL) is the primary license under which the LaTeX kernel and the base LaTeX packages are distributed.",
	["description-mit"] = "A short and simple permissive license with conditions only requiring preservation of copyright and license notices. Licensed works, modifications, and larger works may be distributed under different terms and without source code.",
	["description-mit-0"] = "A short and simple permissive license with no conditions, not even requiring preservation of copyright and license notices. Licensed works, modifications, and larger works may be distributed under different terms and without source code.",
	["description-mpl-2.0"] = "Permissions of this weak copyleft license are conditioned on making available source code of licensed files and modifications of those files under the same license (or in certain cases, one of the GNU licenses). Copyright and license notices must be preserved. Contributors provide an express grant of patent rights. However, a larger work using the licensed work may be distributed under different terms and without source code for files added in the larger work.",
	["description-ms-pl"] = "An open source license with a patent grant.",
	["description-ms-rl"] = "An open source license with a patent grant similar to the Microsoft Public License, with the additional condition that any source code for any derived file be provided under this license.",
	["description-mulanpsl-2.0"] = "A permissive license similar to the Apache License, but explicitly states that it does not grant trademark rights. Mulan Permissive Software License is the first open source license in both Chinese and English approved by OSI.",
	["description-ncsa"] = "The University of Illinois/NCSA Open Source License, or UIUC license, is a permissive free software license, based on the MIT/X11 license  and the BSD 3-clause License. Its conditions include requiring the preservation of copyright and license notices both in source and in binary distributions and the prohibition of using the names of the authors or the project organization to promote or endorse derived products.",
	["description-odbl-1.0"] = "The Open Database License (ODbL) is a license agreement intended to allow users to freely share, modify, and use a database while maintaining this same freedom for others.",
	["description-ofl-1.1"] = "The Open Font License (OFL) is maintained by SIL International. It attempts to be a compromise between the values of the free software and typeface design communities. It is used for almost all open source font projects, including those by Adobe, Google and Mozilla.",
	["description-osl-3.0"] = "OSL 3.0 is a copyleft license that does not require reciprocal licensing on linked works. It also provides an express grant of patent rights from contributors to users, with a termination clause triggered if a user files a patent infringement lawsuit.",
	["description-postgresql"] = "A very short, BSD-style license, used specifically for PostgreSQL.",
	["description-unlicense"] = "A license with no conditions whatsoever which dedicates works to the public domain. Unlicensed works, modifications, and larger works may be distributed under different terms and without source code.",
	["description-upl-1.0"] = "A permissive, OSI- and FSF-approved, GPL-compatible license, expressly allowing attribution with just a copyright notice and a short form link rather than the full text of the license.  Includes an express grant of patent rights.  Licensed works and modifications may be distributed under different terms and without source code, and the patent grant may also optionally be expanded to larger works to permit use as a contributor license agreement.",
	["description-vim"] = "There are no restrictions on using or distributing an unmodified copy of the software. Parts of the software may also be distributed, but the license text must always be included. For modified versions a few restrictions apply. The license is GPL compatible, you may compile the software with GPL libraries and distribute it.",
	["description-wtfpl"] = "The easiest license out there. It gives the user permissions to do whatever they want with your code.",
	["description-zlib"] = "A short permissive license, compatible with GPL. Requires altered source versions to be documented as such.",
	-- metadata
	["metadata-format"] = "	- $label$: $desc$",
	--- usage
	["usage-header"] = "Usage:",
	--- permissions
	["permissions-header"] = "$green$Permissions$reset$:",
	["permissions-commercial-use"] = "Commercial use",
	["permissions-commercial-use-verbose"] = "The licensed material and derivatives may be used for commercial purposes.",
	["permissions-distribution"] = "Distribution",
	["permissions-distribution-verbose"] = "The licensed material may be distributed.",
	["permissions-modifications"] = "Modification",
	["permissions-modifications-verbose"] = "The licensed material may be modified.",
	["permissions-patent-use"] = "Patent use",
	["permissions-patent-use-verbose"] = "This license provides an express grant of patent rights from contributors.",
	["permissions-private-use"] = "Private use",
	["permissions-private-use-verbose"] = "The licensed material may be used and modified in private.",
	--- conditions
	["conditions-header"] = "$yellow$Conditions$reset$:",
	["conditions-disclose-source"] = "Disclose source",
	["conditions-disclose-source-verbose"] = "Source code must be made available when the licensed material is distributed.",
	["conditions-document-changes"] = "State changes",
	["conditions-document-changes-verbose"] = "Changes made to the licensed material must be documented.",
	["conditions-include-copyright"] = "License and copyright notice",
	["conditions-include-copyright-verbose"] = "A copy of the license and copyright notice must be included with the licensed material.",
	["conditions-include-copyright--source"] = "License and copyright notice for source",
	["conditions-include-copyright--source-verbose"] = "A copy of the license and copyright notice must be included with the licensed material in source form, but is not required for binaries.",
	["conditions-network-use-disclose"] = "Network use is distribution",
	["conditions-network-use-disclose-verbose"] = "Users who interact with the licensed material via network are given the right to receive a copy of the source code.",
	["conditions-same-license"] = "Same license",
	["conditions-same-license-verbose"] = "Modifications must be released under the same license when distributing the licensed material. In some cases a similar or related license may be used.",
	["conditions-same-license--file"] = "Same license (file)",
	["conditions-same-license--file-verbose"] = "Modifications of existing files must be released under the same license when distributing the licensed material. In some cases a similar or related license may be used.",
	["conditions-same-license--library"] = "Same license (library)",
	["conditions-same-license--library-verbose"] = "Modifications must be released under the same license when distributing the licensed material. In some cases a similar or related license may be used, or this condition may not apply to works that use the licensed material as a library.",
	--- limitations
	["limitations-header"] = "$red$Limitation$reset$:",
	["limitations-liability"] = "Liability",
	["limitations-liability-verbose"] = "This license includes a limitation of liability.",
	["limitations-patent-use"] = "Patent use",
	["limitations-patent-use-verbose"] = "This license explicitly states that it does NOT grant any rights in the patents of contributors.",
	["limitations-trademark-use"] = "Trademark use",
	["limitations-trademark-use-verbose"] = "This license explicitly states that it does NOT grant trademark rights, even though licenses without such a statement probably do not grant any implicit trademark rights.",
	["limitations-warranty"] = "Warranty",
	["limitations-warranty-verbose"] = "This license explicitly states that it does NOT provide any warranty.",
}
