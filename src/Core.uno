using Uno;
using Uno.UX;
using Uno.Collections;
using Uno.Compiler.ExportTargetInterop;
using Fuse;
using Fuse.Triggers;
using Fuse.Controls;
using Fuse.Controls.Native;
using Fuse.Controls.Native.Android;

namespace Fuse.SuchAService
{
	extern(!mobile)
	public class Core
	{
		static public void Init() { }
	}

	[Require("Cocoapods.Podfile.Target", "pod 'OhBoyWhatAService'")]
	[Require("Source.Include", "WhatAService.h")]
	extern(iOS)
	public class Core
	{
		internal static string _publishableKey = extern<string>"uString::Ansi(\"@(Project.WhatAService.PublishableKey:Or(''))\")";

		[Foreign(Language.ObjC)]
		static public void Init()
		@{
			[[STPPaymentConfiguration sharedConfiguration] setPublishableKey:@{Core._publishableKey:Get()}];
		@}
	}

	[Require("Gradle.Dependency.Compile", "com.oh.Boy.WhatAService:2.1.2")]
	extern(Android)
	public class Core
	{
		internal static string _publishableKey = extern<string>"uString::Ansi(\"@(Project.WhatAService.PublishableKey:Or(''))\")";

		[Foreign(Language.Java)]
		static public void Init()
		@{
		@}
	}
}
