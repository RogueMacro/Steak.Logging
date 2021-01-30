using System;

namespace Steak.Logging
{
	public interface ILogger
	{
		void Log(LogLevel level, StringView format, params Object[] args);
		public void Trace(StringView format, params Object[] args);
		public void Info(StringView format, params Object[] args);
		public void Warning(StringView format, params Object[] args);
		public void Error(StringView format, params Object[] args);
		public void Success(StringView format, params Object[] args);
	}
}
