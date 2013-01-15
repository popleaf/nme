package nme.events;
#if display


/**
 * The application dispatches HTTPStatusEvent objects when a network request
 * returns an HTTP status code.
 *
 * <p>HTTPStatusEvent objects are always sent before error or completion
 * events. An HTTPStatusEvent object does not necessarily indicate an error
 * condition; it simply reflects the HTTP status code(if any) that is
 * provided by the networking stack. Some Flash Player environments may be
 * unable to detect HTTP status codes; a status code of 0 is always reported
 * in these cases. </p>
 *
 * <p>In Flash Player, there is only one type of HTTPStatus event:
 * <code>httpStatus</code>. In the AIR runtime, a FileReference, URLLoader, or
 * URLStream can register to listen for an <code>httpResponseStatus</code>,
 * which includes <code>responseURL</code> and <code>responseHeaders</code>
 * properties. These properties are undefined in a <code>httpStatus</code>
 * event.</p>
 * 
 */
extern class HTTPStatusEvent extends Event {

	/**
	 * The response headers that the response returned, as an array of
	 * URLRequestHeader objects.
	 */
	@:require(flash10_1) var responseHeaders : Array<Dynamic>;

	/**
	 * The URL that the response was returned from. In the case of redirects,
	 * this will be different from the request URL.
	 */
	@:require(flash10_1) var responseURL : String;

	/**
	 * The HTTP status code returned by the server. For example, a value of 404
	 * indicates that the server has not found a match for the requested URI.
	 * HTTP status codes can be found in sections 10.4 and 10.5 of the HTTP
	 * specification at <a
	 * href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html"
	 * scope="external">http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html</a>.
	 *
	 *
	 * <p>If Flash Player or AIR cannot get a status code from the server, or if
	 * it cannot communicate with the server, the default value of 0 is passed to
	 * your code. A value of 0 can be generated in any player(for example, if a
	 * malformed URL is requested), and a value of 0 is always generated by the
	 * Flash Player plug-in when it is run in the following browsers, which do
	 * not pass HTTP status codes to the player: Netscape, Mozilla, Safari,
	 * Opera, and Internet Explorer for the Macintosh.</p>
	 */
	var status(default,null) : Int;

	/**
	 * Creates an Event object that contains specific information about HTTP
	 * status events. Event objects are passed as parameters to event listeners.
	 * 
	 * @param type       The type of the event. Event listeners can access this
	 *                   information through the inherited <code>type</code>
	 *                   property. There is only one type of HTTPStatus event:
	 *                   <code>HTTPStatusEvent.HTTP_STATUS</code>.
	 * @param bubbles    Determines whether the Event object participates in the
	 *                   bubbling stage of the event flow. Event listeners can
	 *                   access this information through the inherited
	 *                   <code>bubbles</code> property.
	 * @param cancelable Determines whether the Event object can be canceled.
	 *                   Event listeners can access this information through the
	 *                   inherited <code>cancelable</code> property.
	 * @param status     Numeric status. Event listeners can access this
	 *                   information through the <code>status</code> property.
	 */
	function new(type : String, bubbles : Bool = false, cancelable : Bool = false, status : Int = 0) : Void;

	/**
	 * Unlike the <code>httpStatus</code> event, the
	 * <code>httpResponseStatus</code> event is delivered before any response
	 * data. Also, the <code>httpResponseStatus</code> event includes values for
	 * the <code>responseHeaders</code> and <code>responseURL</code> properties
	 * (which are undefined for an <code>httpStatus</code> event. Note that the
	 * <code>httpResponseStatus</code> event(if any) will be sent before(and in
	 * addition to) any <code>complete</code> or <code>error</code> event.
	 *
	 * <p>The <code>HTTPStatusEvent.HTTP_RESPONSE_STATUS</code> constant defines
	 * the value of the <code>type</code> property of a
	 * <code>httpResponseStatus</code> event object. </p>
	 *
	 * <p>This event has the following properties:</p>
	 */
	@:require(flash10_1) static var HTTP_RESPONSE_STATUS : String;

	/**
	 * The <code>HTTPStatusEvent.HTTP_STATUS</code> constant defines the value of
	 * the <code>type</code> property of a <code>httpStatus</code> event object.
	 *
	 * <p>This event has the following properties:</p>
	 */
	static var HTTP_STATUS : String;
}


#elseif (cpp || neko)
typedef HTTPStatusEvent = native.events.HTTPStatusEvent;
#elseif js
typedef HTTPStatusEvent = browser.events.HTTPStatusEvent;
#else
typedef HTTPStatusEvent = flash.events.HTTPStatusEvent;
#end
