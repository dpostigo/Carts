//
// Created by Daniela Postigo on 5/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSButton+TextColor.h"


@implementation NSButton (TextColor)


- (NSColor *) textColor {
    NSAttributedString *attrTitle = [self attributedTitle];
    int len = [attrTitle length];
    NSRange range = NSMakeRange(0, MIN(len, 1)); // take color from first char
    NSDictionary *attrs = [attrTitle fontAttributesInRange: range];
    NSColor *textColor = [NSColor controlTextColor];
    if (attrs) {
        textColor = [attrs objectForKey: NSForegroundColorAttributeName];
    }
    return textColor;
}

- (void) setTextColor: (NSColor *) textColor {
    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithAttributedString: [self attributedTitle]];
    int len = [attrTitle length];
    NSRange range = NSMakeRange(0, len);
    [attrTitle addAttribute: NSForegroundColorAttributeName
                      value: textColor
                      range: range];
    [attrTitle fixAttributesInRange: range];
    [self setAttributedTitle: attrTitle];
}

- (void) setFont: (NSFont *) font {
    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithAttributedString: [self attributedTitle]];
    int len = [attrTitle length];
    NSRange range = NSMakeRange(0, len);
    [attrTitle addAttribute: NSFontAttributeName value: font range: range];
    [attrTitle fixAttributesInRange: range];
    [self setAttributedTitle: attrTitle];
}

- (NSColor *) shadowColor {
    NSAttributedString *attrTitle = [self attributedTitle];
    int len = [attrTitle length];
    NSRange range = NSMakeRange(0, MIN(len, 1)); // take color from first char
    NSDictionary *attrs = [attrTitle fontAttributesInRange: range];
    NSShadow *shadow;
    if (attrs) {
        shadow = [attrs objectForKey: NSShadowAttributeName];
    }
    return shadow.shadowColor;
}


- (void) setShadow: (NSShadow *) shadow {
    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithAttributedString: [self attributedTitle]];
    int len = [attrTitle length];
    NSRange range = NSMakeRange(0, len);

    [attrTitle addAttribute: NSShadowAttributeName value: shadow range: range];
    [attrTitle fixAttributesInRange: range];
    [self setAttributedTitle: attrTitle];
}

@end