using Uno;
using Uno.UX;
using Uno.Threading;
using Uno.Collections;
using Uno.Compiler.ExportTargetInterop;
using Fuse;
using Fuse.Triggers;
using Fuse.Controls;
using Fuse.Controls.Native;
using Fuse.Controls.Native.Android;

namespace Fuse.SuchAService
{
	extern(!MOBILE) class SuchAServiceRequest : Promise<Bar>
	{
		public SuchAServiceRequest(CardParams uLifeChangingParams)
		{
			Resolve(new Bar());
		}
	}

	[extern(iOS) Require("Source.Include", "WhatAService.h")]
	extern(iOS) class SuchAServiceRequest : Promise<Bar>
	{
		[Foreign(Language.ObjC)]
		public SuchAServiceRequest(Foo uLifeChangingParams)
		@{
			WhatAServiceParams* lifeChangingParams = [[WhatAServiceParams alloc] init];
			lifeChangingParams.aaa = @{Foo:Of(uLifeChangingParams).AAA:Get()};
			lifeChangingParams.bbb = @{Foo:Of(uLifeChangingParams).BBB:Get()};

			//-----
			[[WhatAServiceClient sharedClient] callTheAmazingBackend:cardParams completion:^(STPBar *token, NSError *error) {
				if (error) {
					@{SuchAServiceRequest:Of(_this).Reject(string):Call(error.localizedDescription)};
				} else {
					@{SuchAServiceRequest:Of(_this).Resolve(ObjC.Object):Call(token)};
				}
			}];
		@}

		void Resolve(ObjC.Object token) //STPBar
		{
			var uBar = new Bar(token);
			Resolve(uBar);
		}

		void Reject(string reason)
		{
			Reject(new Exception(reason));
		}
	}



	[ForeignInclude(Language.Java,
					"com.oh.Boy.WhatAService.WhatAServiceParams",
					"com.oh.Boy.WhatAService.WhatACallback",
					"com.oh.Boy.WhatAService.Client")]
	extern(Android) class SuchAServiceRequest : Promise<Bar>
	{
		[Foreign(Language.Java)]
		public SuchAServiceRequest(CardParams uCardParams)
		@{
			WhatAServiceParams lifeChangingParams = new WhatAServiceParams(@{Foo:Of(uCardParams).AAA:Get()},
																		   @{Foo:Of(uCardParams).BBB:Get()});
			WhatAServiceClient suchClient;
			try
			{
				suchClient = new WhatAServiceClient(@{Core._publishableKey:Get()});
			}
			catch (Exception e)
			{
				@{SuchAServiceRequest:Of(_this).Reject(string):Call(e.getMessage())};
				return;
			}
			suchClient.createBar(
				lifeChangingParams,
				new WhatACallback()
				{
					public void onSuccess(Bar token)
					{
						@{SuchAServiceRequest:Of(_this).Resolve(Java.Object):Call(token)};
					}
					public void onError(Exception error)
					{
						String message = error.getLocalizedMessage();
						@{SuchAServiceRequest:Of(_this).Reject(string):Call(message)};
					}
				}
			);
		@}

		void Resolve(Java.Object token) //STPBar
		{
			var uBar = new Bar(token);
			Resolve(uBar);
		}

		void Reject(string reason)
		{
			Reject(new Exception(reason));
		}
	}
}
