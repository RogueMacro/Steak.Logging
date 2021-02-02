using System;

namespace Steak.Logging
{
	[AllowDuplicates]
	enum LogLevel
	{
		case Trace;
		case Info;
		case Warning;
		case Error;
		case Success;
		case Default = Info;
	}

	extension LogLevel
	{
		public ConsoleColor Color
		{
			get
			{
				switch (this)
				{
				case .Trace:
 					return Log.TraceColor;
				case .Info:
					return Log.InfoColor;
				case .Warning:
					return Log.WarningColor;
				case .Success:
					return Log.SuccessColor;
				case .Error:
					return Log.ErrorColor;
				}
			}
		}
	}
}
