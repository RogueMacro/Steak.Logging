using System;

namespace Steak.Logging
{
	enum LogLevel
	{
		case Trace;
		case Info;
		case Warning;
		case Success;
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
				case .Info:
					return Formatting.InfoColor;
				case .Warning:
					return Formatting.WarningColor;
				case .Success:
					return Formatting.SuccessColor;
				case .Error:
					return Formatting.ErrorColor;
				default:
					return .White;
				}
			}
		}
	}
}
