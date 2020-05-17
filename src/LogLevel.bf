using System;

namespace Steak.Logging
{
	enum LogLevel
	{
		case Trace;
		case Debug;
		case Success;
		case Warning;
		case Error;
		case Off;
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
 					return Formatting.TraceColor;
				case .Debug:
					return Formatting.DebugColor;
				case .Success:
					return Formatting.SuccessColor;
				case .Warning:
					return Formatting.WarningColor;
				case .Error:
					return Formatting.ErrorColor;
				default:
					return .White;
				}
			}
		}
	}
}
