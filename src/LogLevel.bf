using System;

namespace Steak.Logging
{
	[AllowDuplicates]
	enum LogLevel
	{
		case None;
		case Trace;
		case Info;
		case Warning;
		case Success;
		case Error;
	}

	extension LogLevel
	{
		public static Self Default = .Info;

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
				default:
					return .White;
				}
			}
		}
	}
}
